import 'dart:async';
import 'package:flutter/material.dart';
import '../layouts/main_layout.dart';
import '../helpers/change_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ChangeScreen.newScreen(context, const MainLayout());
      timer.cancel();
    });
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //sappBar: AppBar(title: const Text("Futter General")),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: size.width,
            height: size.height,
            color: Colors.orange[300],
          ),
          Container(
              height: 0.7 * size.height,
              width: size.width,
              alignment: Alignment.center,
              // color: Colors.red,
              child: const Image(image: AssetImage("assets/images/logo.png"))
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     alignment: Alignment(0, 1),
              //     fit: BoxFit.cover,
              //     image: AssetImage("assets/images/logo.jpg"),
              //   ),
              // ),
              ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 0.3 * size.height,
              width: size.width,
              // color: Colors.red,
              alignment: Alignment.center,
              child:
                  const Image(image: AssetImage("assets/images/loading.gif")),
              // child: TextButton.icon(
              //   icon: const Icon(
              //     Icons.start,
              //     size: 25,
              //   ),
              //   label: const Text("Start"),
              //   style: TextButton.styleFrom(
              //     backgroundColor: Colors.white,
              //   ),
              //   onPressed: () {
              //     // ScaffoldMessenger.of(context).showSnackBar(
              //     //     const SnackBar(content: Text("Start now")))

              //     Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(builder: (BuildContext context) {
              //       return const LoginScreen();
              //     }));
              //   },
              // ),
            ),
          ),
          // MyButton(
          //   "hihi",
          //   onPressed: () {
          //     ScaffoldMessenger.of(context)
          //         .showSnackBar(const SnackBar(content: Text("leu leu")));
          //   },
          //   style: MyButtonStyle(
          //     padding: [100, 20],
          //     margin: [100, 0, 0],
          //     backColor: Colors.red,
          //     color: Colors.green,
          //     borderRadius: 0,
          //     border: [5, true, Colors.yellow],
          //   ),
          // ),
        ],
      ),
    );
  }
}
