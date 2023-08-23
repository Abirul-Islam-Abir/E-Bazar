import 'package:flutter/material.dart';

TextStyle displayLarge({color}) {
  return TextStyle(fontSize: 80, color: color);
}

TextStyle displayMedium({color}) {
  return TextStyle(fontSize: 70, color: color);
}

TextStyle displaySmall({color}) {
  return TextStyle(fontSize: 60, color: color);
}

TextStyle displayTooSmall({color}) {
  return TextStyle(fontSize: 50, color: color);
}

TextStyle headlineLarge({color}) {
  return TextStyle(fontSize: 40, color: color, fontWeight: FontWeight.bold);
}

TextStyle headlineMedium({color}) {
  return TextStyle(fontSize: 35, color: color, fontWeight: FontWeight.bold);
}

TextStyle headlineSmall({color}) {
  return TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.bold);
}

TextStyle headlineTooSmall({color}) {
  return TextStyle(fontSize: 25, color: color, fontWeight: FontWeight.bold);
}

TextStyle titleLarge({color, fontWeight}) {
  return TextStyle(fontSize: 22, color: color, fontWeight: fontWeight);
}

TextStyle titleMedium({color, fontWeight}) {
  return TextStyle(fontSize: 20, color: color, fontWeight: fontWeight);
}

TextStyle titleSmall({color, fontWeight}) {
  return TextStyle(fontSize: 18, color: color, fontWeight: fontWeight);
}

TextStyle titleTooSmall({color, fontWeight}) {
  return TextStyle(fontSize: 15, color: color, fontWeight: fontWeight);
}
