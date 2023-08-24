import '../../../../utils/export.dart';

class PageViewCard extends StatelessWidget {
  const PageViewCard({
    super.key,
    required this.headline,
    required this.subtitle,
    required this.img,
  });

  final String headline, subtitle, img;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            HeadlineText(text: headline),
            SubtitleText(text: subtitle),
          ],
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Image.asset(img,
                height: Get.height / 2.2, width: Get.width / 1.2))
      ],
    );
  }
}
