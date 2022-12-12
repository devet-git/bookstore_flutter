import 'package:flutter/material.dart';
import '../helpers/gen_edge_insets.dart';

class MyBoxStyle {
  MyBoxStyle({
    this.width,
    this.height,
    this.padding = const [0],
    this.margin = const [0],
    this.border = const [0, "none", Colors.red],
    this.borderRadius = 0,
    this.color = Colors.black,
    this.backColor = Colors.white,
    this.boxShadow = const [
      [0, 0, 0, 0, Colors.white],
    ],
  });
  double? height, width;
  List<double> padding, margin;
  Color color, backColor;
  List border;
  double borderRadius;
  List<List> boxShadow;
}

// ignore: must_be_immutable
class MyBox extends StatelessWidget {
  MyBox({
    super.key,
    required this.child,
    required this.style,
  });
  final Widget child;
  MyBoxStyle style = MyBoxStyle();

  @override
  Widget build(BuildContext context) {
    var container = Container(
      // height: style.height,
      // width: style.width,
      margin: genEdgeInsets(style.margin),
      padding: genEdgeInsets(style.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(style.borderRadius),
        color: style.backColor,
        border: Border.all(
          width: style.border[0].toDouble(),
          style:
              style.border[0] == "solid" ? BorderStyle.solid : BorderStyle.none,
          color: style.border[2],
        ),
        boxShadow: List<BoxShadow>.generate(
          style.boxShadow.length,
          (i) => BoxShadow(
            offset: Offset(
              style.boxShadow[i][0].toDouble(),
              style.boxShadow[i][1].toDouble(),
            ),
            blurRadius: style.boxShadow[i][2].toDouble(),
            spreadRadius: style.boxShadow[i][3].toDouble(),
            color: style.boxShadow[i][4],
          ),
        ),
      ),
      child: child,
    );
    return container;
  }
}
