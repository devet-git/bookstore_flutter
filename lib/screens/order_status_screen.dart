import 'package:another_stepper/another_stepper.dart';
import 'package:book_app/components/my_button.dart';
import 'package:book_app/helpers/change_screen.dart';
import 'package:flutter/material.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Đã đặt hàng",
        textStyle: const TextStyle(
          color: Colors.green,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.check, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText("Đang chuẩn bị hàng"),
      subtitle: StepperText("Your order is being prepared"),
      iconWidget: Container(
        // padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.looks_two, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText(
        "Đang giao hàng",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver your item"),
      iconWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: const Icon(Icons.looks_3, color: Colors.white),
      ),
    ),
    StepperData(
      title: StepperText(
        "Đã giao hàng",
        textStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tình trạng đơn hàng'),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => ChangeScreen.preScreen(context),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Mã vận đơn: dxXjgu12",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              Text(
                "Mã sách: FFxhdf",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 25),
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              gap: 20,
              iconWidth: 40,
              iconHeight: 40,
              activeBarColor: Colors.green,
              inActiveBarColor: Colors.grey,
              activeIndex: 1,
              barThickness: 8,
            ),
          ),
          MyButton(
            "Đã nhận hàng",
            style: MyButtonStyle(
              backColor: Colors.blue[100],
              borderRadius: 10,
              padding: [20, 25],
              border: [1.0, "solid", Colors.blue],
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
