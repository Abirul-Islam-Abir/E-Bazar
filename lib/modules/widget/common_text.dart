import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/app_text_theme.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color = AppColor.kTextColor,
    this.onTap,
  });

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Text(
        text,
        style: titleTooSmall(color: color).copyWith(fontWeight: fontWeight),
      ),
    );
  }
}