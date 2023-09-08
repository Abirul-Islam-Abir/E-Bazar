import 'package:ecommerce_firebase/modules/screens/cart%20screen/components/cart_appbar.dart';
import 'package:ecommerce_firebase/modules/screens/cart%20screen/components/cart_body.dart';
import 'package:ecommerce_firebase/modules/screens/cart%20screen/components/check_out.dart';
import 'package:ecommerce_firebase/utils/export.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CartAppBar(),
      body: const CartBody(),
      bottomNavigationBar: const Checkout(),
    );
  }
}
