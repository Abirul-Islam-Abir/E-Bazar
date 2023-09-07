import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: size.width * 0.35,
      // width: 100,
      height: size.height * 0.2,
      // height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 238, 241),
          borderRadius: BorderRadius.circular(10)),
      child: Image.asset(
        image,
        cacheHeight: (size.height * 0.14).toInt(),
        cacheWidth: (size.width * 0.23).toInt(),
      ),
    );
  }
}
