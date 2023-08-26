import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_color.dart';
import '../../utils/app_size.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.color = AppColor.kTextColor,   this.align =Alignment.topCenter,
  });

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
final Alignment align;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        style: GoogleFonts.cormorant(
            fontSize: kDefaultSize,
            color: color,
            fontWeight: fontWeight,
            fontStyle: FontStyle.italic),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
