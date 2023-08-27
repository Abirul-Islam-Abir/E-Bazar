import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_color.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onPress,
    required this.text,
    this.color,
  });

  final Function() onPress;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Get.width / 1.2,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: onPress,
          child: Text(
            text,
            style: const TextStyle(color: AppColor.kWhiteColor),
          )),
    );
  }
}
