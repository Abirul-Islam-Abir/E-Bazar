import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/utils/export.dart';
import 'package:get/get.dart';

class FirstScreenController extends GetxController {
  final collection = FirebaseFirestore.instance.collection('matchList');
}
