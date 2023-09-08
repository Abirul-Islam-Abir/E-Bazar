import 'package:flutter/material.dart';

import '../../../model/home_screen_model.dart';
import '../../../utils/image_path/image_path.dart';

class SpecialOfferImage extends StatelessWidget {
  SpecialOfferImage({
    super.key,
    required this.size,
  });

  final Size size;

  final List<HomeScreenModel> specialOfferForYou = [
    HomeScreenModel.specialOffer(
        image: ImagePath.gadgets1, title: "SmartPhone", subtitle: "18 Brands"),
    HomeScreenModel.specialOffer(
        image: ImagePath.fashion, title: "Fashion", subtitle: "24 Brands"),
    HomeScreenModel.specialOffer(
        image: ImagePath.gadgets2, title: "SmartPhone", subtitle: "18 Brands"),
    HomeScreenModel.specialOffer(
        image: ImagePath.gadgets3, title: "SmartPhone", subtitle: "18 Brands"),
    HomeScreenModel.specialOffer(
        image: ImagePath.mobile, title: "SmartPhone", subtitle: "18 Brands"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15, // Adjust the height as needed
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: specialOfferForYou.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("click on special offer at index $index");
                        // onTap();
                      },
                      child: ColorFiltered(
                        // make image dark color
                        colorFilter:
                            ColorFilter.mode(Colors.black45, BlendMode.darken),
                        child: Image.asset(
                          specialOfferForYou[index].image!,
                          fit: BoxFit.cover,
                          width: size.width * 0.6,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height *
                          0.03, // Adjust the position of the text as needed
                      left: size.width *
                          0.05, // Adjust the position of the text as needed
                      child: Text(
                        specialOfferForYou[index]
                            .title!, // Replace with your text
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height *
                          0.06, // Adjust the position of the text as needed
                      left: size.width *
                          0.05, // Adjust the position of the text as needed
                      child: Text(
                        // subtitle,
                        specialOfferForYou[index].subtitle!,
                        style: TextStyle(
                          fontSize: size.width * 0.03,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
