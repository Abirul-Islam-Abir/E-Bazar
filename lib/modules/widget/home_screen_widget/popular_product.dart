import 'package:flutter/material.dart';

import '../../../model/home_screen_model.dart';
import '../../../utils/image_path/image_path.dart';

class PopularProduct extends StatelessWidget {
  PopularProduct({
    super.key,
    required this.size,
  });

  final Size size;
  //list of popular product image
  final List<HomeScreenModel> popularProduct = [
    HomeScreenModel.popularProductImage(popularImage: ImagePath.gameController),
    HomeScreenModel.popularProductImage(popularImage: ImagePath.pant),
    HomeScreenModel.popularProductImage(popularImage: ImagePath.dress),
    HomeScreenModel.popularProductImage(popularImage: ImagePath.games),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularProduct.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: size.width * 0.35,
         
            height: size.height * 0.2,
          
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 238, 241),
                borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
              onTap: () {
                print("Selected product index is $index");
              },
              child: Image.asset(
                popularProduct[index].popularImage!,
                cacheHeight: (size.height * 0.14).toInt(),
                cacheWidth: (size.width * 0.23).toInt(),
              ),
            ),
          );
        });
  }
}
