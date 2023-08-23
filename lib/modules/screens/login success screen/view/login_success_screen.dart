import 'package:get/get.dart';

import '../../../../utils/export.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.loginSuccess),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            const SizedBox(height: kPrimaryBigSize),
            Image.asset(
              'assets/images/success.png',
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: kPrimaryBigSize),
            const HeadlineText(text: AppString.loginSuccess),
            const SizedBox(height: kPrimaryBigSize),
            GlobalButton(onPress: () {}, text: AppString.continues)
          ],
        ),
      ),
    );
  }
}
