import 'dart:async';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/export.dart';

class OtpVerificationController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }
}
