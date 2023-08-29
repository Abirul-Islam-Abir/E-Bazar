import 'package:ecommerce_firebase/utils/export.dart';

class FirstScreenController extends GetxController {
  final collection = FirebaseFirestore.instance.collection('matchList');
  final TextEditingController groupAController = TextEditingController();
  final TextEditingController groupAScoreController = TextEditingController();
  final TextEditingController groupBController = TextEditingController();
  final TextEditingController groupBScoreController = TextEditingController();
  final TextEditingController remainingTimeController = TextEditingController();
  final TextEditingController totalTimeController = TextEditingController();

  Future<void> addFootballScore() async {
    return collection.doc().set({
      'groupA': groupAController.text,
      'groupB': groupBController.text,
      'groupAScore': groupAScoreController.text,
      'groupBScore': groupBScoreController.text,
      'remainingTime': '${remainingTimeController.text}:10',
      'totalTime': '${totalTimeController.text}:00',
    }).then((value) {
      NotificationService().showNotification(
          '${groupAController.text} VS ${groupBController.text}',
          'Starting new football match!',
          'payload');
      Get.back();
      groupAController.clear();
      groupBController.clear();
      groupAScoreController.clear();
      groupBScoreController.clear();
      remainingTimeController.clear();
      totalTimeController.clear();
    });
  }
}
