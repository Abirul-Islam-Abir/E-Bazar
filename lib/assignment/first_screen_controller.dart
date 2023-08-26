import 'package:ecommerce_firebase/utils/export.dart';

class FirstScreenController extends GetxController {
  final collection = FirebaseFirestore.instance.collection('matchList');
}
