import 'package:flutter/foundation.dart';

class CombinedNotifier extends ChangeNotifier {
  final List<ChangeNotifier> _notifiers;

  CombinedNotifier(this._notifiers) {
    for (final n in _notifiers) {
      n.addListener(notifyListeners);
    }
  }

  @override
  void dispose() {
    for (final n in _notifiers) {
      n.removeListener(notifyListeners);
    }
    super.dispose();
  }
}
