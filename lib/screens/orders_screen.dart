import 'package:book_app/helpers/change_screen.dart';
import 'package:book_app/screens/order_status_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đơn hàng"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.green, Colors.white],
            ),
          ),
        ),
      ),
      body: ListView(children: [
        ListTile(
          leading: const Icon(Icons.card_giftcard),
          // trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: const Text("Think more do more"),
          onTap: () =>
              ChangeScreen.nextScreen(context, const OrderStatusScreen()),
        ),
      ]),
    );
  }
}
