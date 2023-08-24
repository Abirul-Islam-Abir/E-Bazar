import 'dart:convert';
import 'dart:io';
 import 'dart:typed_data';

String baseUrlBase64 = "data:image/jpeg;base64,";

Uint8List decodeBase64Image(String base64String) {
  // Remove any data type prefix in the base64 string
  String cleanedBase64 =
  base64String.replaceAll(RegExp(r'data:image/[^;]+;base64,'), '');
  // Decode the base64 string and return the bytes
  return base64Decode(cleanedBase64);
}

Future encodeBase64Image(File imageFile) async {
  List<int> imageBytes = await imageFile.readAsBytes();
  return base64Encode(imageBytes);
}