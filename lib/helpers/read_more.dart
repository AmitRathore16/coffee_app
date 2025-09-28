import 'package:flutter/material.dart';
import 'package:coffee/theme/app_theme.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final int trimLines;
  final Color linkColor;

  const ReadMoreText({
    Key? key,
    required this.text,
    this.style,
    this.trimLines = 3,
    this.linkColor = AppTheme.primaryColor,
  }) : super(key: key);

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Measure overflow for the COLLAPSED state (trimLines)
      final span = TextSpan(text: widget.text, style: widget.style);
      final tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
        maxLines: widget.trimLines,
      )..layout(maxWidth: constraints.maxWidth);

      final isOverflowing = tp.didExceedMaxLines;

      return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: widget.style,
              maxLines: _isExpanded ? null : widget.trimLines,
              overflow:
              _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              softWrap: true,
            ),
            if (isOverflowing)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  child: Text(
                    _isExpanded ? 'Read less' : 'Read more',
                    style: widget.style?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: widget.linkColor,
                    ) ??
                        TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.linkColor,
                        ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}