import '../../../../utils/export.dart';

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

  @override
  void dispose() {
    textEditingController.dispose();
    formKey.currentState!.reset();
    super.dispose();
  }
}
