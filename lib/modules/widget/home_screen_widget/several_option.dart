import 'package:flutter/material.dart';

class SeveralOption extends StatelessWidget {
  const SeveralOption({
    super.key,
    required this.size,
    required this.iconData,
    required this.text,
  });

  final Size size;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width * 0.16,
          height: size.height * 0.09,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 250, 232, 220),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(
            iconData,
            size: size.width * 0.06,
            color: const Color.fromARGB(255, 250, 182, 158),
          ),
        ),
        SizedBox(
          height: size.height * 0.009,
        ),
        SizedBox(
          width: size.width * 0.1,
          height: size.height * 0.05,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 11, color: Color.fromARGB(255, 134, 133, 133)),
          ),
        ),
      ],
    );
  }
}
