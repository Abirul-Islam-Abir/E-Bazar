import 'package:flutter/material.dart';

import '../../../../utils/export.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      title: Column(
        children: [
          const Text(
            'Your Cart',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Text(
            '4 items',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 16,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}