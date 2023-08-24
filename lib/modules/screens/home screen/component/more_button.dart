import '../../../../utils/export.dart';

class MoreButton extends StatelessWidget {
  final String product;
  final GestureTapCallback onTap;

  const MoreButton({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.kTextColor, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'more >',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.kTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}