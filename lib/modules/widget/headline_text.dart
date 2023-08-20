import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_color.dart';
import '../../utils/app_size.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        text,
        style: GoogleFonts.lilitaOne(
          fontSize: kPrimaryBigSize ,
          fontStyle: FontStyle.italic,
          color: AppColor.kPrimaryColor,
        ),
      ),
    );
  }
}