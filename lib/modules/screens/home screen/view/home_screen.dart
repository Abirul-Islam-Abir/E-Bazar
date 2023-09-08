import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../utils/image_path/image_path.dart';
import '../../../widget/home_screen_widget/cash_back_offer.dart';
import '../../../widget/home_screen_widget/popular_product.dart';
import '../../../widget/home_screen_widget/search_product.dart';
import '../../../widget/home_screen_widget/several_option.dart';
import '../../../widget/home_screen_widget/special_offer_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.04),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //srarch bar, shopping cart and bell icon
              SearchProduct(size: size),
              SizedBox(
                height: size.height * 0.04,
              ),
              //cashback offer card
              CashBackOffer(size: size),
              //height space
              SizedBox(
                height: size.height * 0.04,
              ),
              //widget for several option
              SeveralOption(
                size: size,
              ),
              //height space
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Text(
                    "Special for you",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(
                        color: Colors.grey, fontSize: size.width * 0.035),
                  ),
                ],
              ),
              //height space
              SizedBox(
                height: size.height * 0.04,
              ),

              //Special offer for you
              SizedBox(
                height: size.height * 0.15,
                child: SpecialOfferImage(
                  size: size,
                ),
              ),
              //height space
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                children: [
                  Text(
                    "Popular Product",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(
                        color: Colors.grey, fontSize: size.width * 0.035),
                  ),
                ],
              ),
              //height space
              SizedBox(
                height: size.height * 0.04,
              ),
              //popular product image
              SizedBox(
                height: size.height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PopularProduct(
                      size: size,
                      image: ImagePath.mobile,
                      onTap: () {
                        print("Click on First popular Product");
                      },
                    ),
                    PopularProduct(
                      size: size,
                      image: ImagePath.mobile,
                      onTap: () {
                        print("Click on Second popular Product");
                      },
                    ),
                    PopularProduct(
                      size: size,
                      image: ImagePath.mobile,
                      onTap: () {
                        print("Click on Third popular Product");
                      },
                    ),
                    PopularProduct(
                      size: size,
                      image: ImagePath.mobile,
                      onTap: () {
                        print("Click on Fourth popular Product");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
