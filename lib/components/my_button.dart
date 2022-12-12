import 'package:flutter/material.dart';
import '../helpers/gen_edge_insets.dart';

class MyButtonStyle {
  MyButtonStyle({
    this.padding = const [],
    this.margin = const [0],
    this.border = const [0.0, "solid", Colors.red],
    this.borderRadius = 0,
    this.color,
    this.backColor,
  });
  List<double> padding, margin;
  Color? color, backColor;
  List? border;
  double borderRadius;
}

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton(
    this.text, {
    super.key,
    required this.style,
    required this.onPressed,
    this.onHover,
    this.onFocusChange,
    this.onLongPress,
  });

  MyButtonStyle style = MyButtonStyle();
  String text;
  Function() onPressed;
  Function(bool)? onHover;
  Function(bool)? on;
  Function()? onLongPress;
  Function(bool)? onFocusChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: genEdgeInsets(style.margin),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: style.backColor,
          padding: genEdgeInsets(style.padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(style.borderRadius),
            side: BorderSide(
              width: (style.border![0]).toDouble(),
              style: (style.border![1]) == true
                  ? BorderStyle.solid
                  : BorderStyle.none,
              color: style.border![2],
            ),
          ),
        ),
        onPressed: onPressed,
        onHover: onHover,
        onFocusChange: onFocusChange,
        onLongPress: onLongPress,
        child: Text(text, style: TextStyle(color: style.color)),
      ),
    );
  }
}
