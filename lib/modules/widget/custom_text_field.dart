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
      this.suffixIcon});

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '*',
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
