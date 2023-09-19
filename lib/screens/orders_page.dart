import 'package:flutter/material.dart';
class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.height,
      width: size.width *.3,
      color: Colors.blue,

    );
  }
}
