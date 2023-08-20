import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../utils/export.dart';
import '../controller/otp_verification_controller.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: AppString.signUp),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height / 1.2,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              child: Column(
                children: [
                  const Spacer(),
                  const HeadlineText(text: AppString.otpVerification),
                  SubtitleText(
                      text: 'Enter the code sent to ${Get.arguments} '),
                  const Spacer(),
                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 30,
                      ),
                      child: GetBuilder<OtpVerificationController>(
                          builder: (logic) => PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                obscureText: true,
                                obscuringCharacter: '*',
                                obscuringWidget: const FlutterLogo(
                                  size: 24,
                                ),
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                validator: (v) {
                                  if (v!.length < 3) {
                                    return "I'm from validator";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 50,
                                    fieldWidth: 40,
                                    activeFillColor: Colors.white),
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                errorAnimationController:
                                    controller.errorController,
                                controller: controller.textEditingController,
                                keyboardType: TextInputType.number,
                                boxShadows: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) {
                                  debugPrint("Completed");
                                },
                                // onTap: () {
                                //   print("Pressed");
                                // },
                                onChanged: (value) {
                                  debugPrint(value);

                                  controller.currentText = value;
                                },
                                beforeTextPaste: (text) {
                                  debugPrint("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: GetBuilder<OtpVerificationController>(
                        builder: (logic) => Text(
                              controller.hasError
                                  ? "*Please fill up all the cells properly"
                                  : "",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive the code? ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.snackbar('Send Otp', 'message');
                        },
                        child: const Text(
                          "RESEND",
                          style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GlobalButton(
                    onPress: () {},
                    text: AppString.verify,
                  ),
                  const SizedBox(height: kPrimaryBigSize),
                  const Spacer(),
                  const CommonText(
                    text: 'Continue that confirm to our terms & conditions!',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
