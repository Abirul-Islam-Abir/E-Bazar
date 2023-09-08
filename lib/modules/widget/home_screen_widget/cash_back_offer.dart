import 'package:flutter/material.dart';

class CashBackOffer extends StatelessWidget {
  const CashBackOffer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 80, 63, 149),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A Summer Surprise",
              style: TextStyle(
                // color: Color.fromARGB(255, 170, 164, 197),
                color: Colors.white70,
                letterSpacing: 0.5,
                fontSize: size.width * 0.03,
              ),
            ),
            SizedBox(
              height: size.height * 0.013,
            ),
            Text(
              "Cashback 20%",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.05,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
