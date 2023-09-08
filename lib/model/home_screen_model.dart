import 'package:ecommerce_firebase/utils/export.dart';

class HomeScreenModel {
   String? image;
   String? title;
   String? subtitle;
   IconData? icon;
  HomeScreenModel.specialOffer(
      {required this.image, required this.title, required this.subtitle});
      HomeScreenModel.icons({required this.icon});
}

