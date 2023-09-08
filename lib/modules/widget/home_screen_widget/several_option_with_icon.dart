import 'package:flutter/material.dart';

import '../../../model/home_screen_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SeveralOptionWithIcon extends StatelessWidget {
  SeveralOptionWithIcon({
    super.key,
    required this.size,
  });

  final Size size;

  final List<HomeScreenModel> iconListForSeveralOption = [
    HomeScreenModel.icons(
      icon: Icons.flash_on_rounded,
    ),
    HomeScreenModel.icons(
      icon: MdiIcons.newspaperVariant,
    ),
    HomeScreenModel.icons(
      icon: MdiIcons.controllerClassic,
    ),
    HomeScreenModel.icons(
      icon: Icons.wallet_giftcard,
    ),
    HomeScreenModel.icons(
      icon: MdiIcons.leafCircle,
    ),
  ];
  @override
  Widget build(BuildContext context) {
 
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.09,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: iconListForSeveralOption.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.16,
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 232, 220),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: IconButton(
                    onPressed: () {
                      print(
                          "Click on icon which index number is $index"); //take action when user click on icon
                    },
                    icon: Icon(
                      iconListForSeveralOption[index].icon,
                      size: size.width * 0.07,
                      color: const Color.fromARGB(255, 250, 182, 158),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                )
              ],
            );
          }),
    );

  }
}
