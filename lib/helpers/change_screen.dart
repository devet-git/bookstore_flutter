import 'package:flutter/material.dart';

class ChangeScreen {
  static void nextScreen(BuildContext context, Widget screen, {String? name}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => screen,
        settings: RouteSettings(name: name),
      ),
    );
  }

  static void newScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => screen),
    );
  }

  static void newUniqueScreen(BuildContext context, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static void nextScreenAnimated(BuildContext context, Widget page) {
    Route createRoute() {
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeIn;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    Navigator.of(context).push(createRoute());
  }

  static void preScreen(BuildContext context) => Navigator.of(context).pop();
}
