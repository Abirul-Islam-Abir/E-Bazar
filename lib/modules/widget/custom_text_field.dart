import 'package:ecommerce_firebase/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.label,
      this.maxLines = 1,
      this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.obscureText = false,
      this.autofocus = false,
      this.readOnly = false,
      this.suffixIcon,
      this.initialValue,
      this.onChanged});

  final String hintText;
  final String label;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? initialValue;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscuringCharacter: '*',
      initialValue: initialValue,
      readOnly: readOnly,
      autofocus: autofocus,
      obscureText: obscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(kTextSize),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: GoogleFonts.abel(),
        label: Text(
          label,
          style: GoogleFonts.abel(),
        ),
      ),
    );
  }
}
