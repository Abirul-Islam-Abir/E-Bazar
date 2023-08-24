import '../../../../utils/export.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, this.items});

  final List<Widget>? items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, pages) {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
