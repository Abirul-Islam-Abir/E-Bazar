import 'package:flutter/material.dart';

class SpecialOfferImage extends StatelessWidget {
  const SpecialOfferImage({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final Size size;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15, // Adjust the height as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
                width: size.width * 0.6,
              ),
              Positioned(
                top: size.height *
                    0.03, // Adjust the position of the text as needed
                left: size.width *
                    0.05, // Adjust the position of the text as needed
                child: Text(
                  title, // Replace with your text
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: size.height *
                    0.06, // Adjust the position of the text as needed
                left: size.width *
                    0.05, // Adjust the position of the text as needed
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
