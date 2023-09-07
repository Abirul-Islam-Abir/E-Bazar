import 'package:flutter/material.dart';
class SearchProduct extends StatelessWidget {
   TextEditingController search_TEC = TextEditingController();
   SearchProduct({
    super.key,
    required this.size,
  });

  final Size size;
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.6,
          height: size.height * 0.055,
          child: TextField(
            controller: search_TEC,
            decoration: InputDecoration(
              hintText: 'Search Product',
              hintStyle: TextStyle(fontSize: size.width * 0.038),
              contentPadding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 243, 243, 244),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
              height: size.height * 0.06,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 243, 244),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: size.width * 0.06,
                color: Colors.grey,
              )),
        ),
        Expanded(
          child: Container(
              height: size.height * 0.06,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 243, 243, 244),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.alarm_on,
                size: size.width * 0.06,
                color: Colors.grey,
              )),
        ),
      ],
    );
  }
}

