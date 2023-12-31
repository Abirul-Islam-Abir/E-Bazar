import '../../../../utils/export.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.buyNow,
    required this.isFav,
  });

  final String img, name, price;
  final Function() buyNow, isFav;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.network(
                  img,
                  height: 70,
                  width: 70,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/no_internet.jpg',
                    height: 70,
                    width: 70,
                  ),
                )),
            const Spacer(),
            Text(name, style: Theme.of(context).textTheme.titleSmall),
            Text('\$$price',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: kDefaultSize),
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: FittedBox(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              kPrimaryBigSize))),
                                  backgroundColor: AppColor.kPurpleColor),
                              onPressed: buyNow,
                              child: const Text(AppString.buyNow)))),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: isFav,
                          icon: const Icon(
                            Icons.heart_broken,
                            color: AppColor.kRedColor,
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
