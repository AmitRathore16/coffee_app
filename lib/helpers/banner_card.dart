import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/banner.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 60,
              height: 26,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 81, 81, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Promo",
                style: TextStyle(
                  fontFamily: "Sora",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 47,
            left: 16,
            child: SizedBox(
              width: 204,
              height: 76,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Buy one get",
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "one FREE",
                    style: TextStyle(
                      fontFamily: "Sora",
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
