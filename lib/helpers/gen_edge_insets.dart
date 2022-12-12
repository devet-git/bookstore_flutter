import 'package:flutter/material.dart';

/// This function is used to generate EdgeInsets for widgets, with usage like CSS
///
/// genEdgeInsets([5]): top = right = bottom = left = 5
///
/// genEdgeInsets([5, 10]): top = bottom = 5; right = left = 10
///
/// genEdgeInsets([5, 10, 15]): top = 5; right = left = 10; bottom = 15
///
/// genEdgeInsets([5, 10, 15, 20]): top = 5; right = 10; bottom = 15;  left = 20
///
/// Example using:
/// ```dart
/// Container(
///   padding: genEgdeInsets([5,5])
///   margin: genEgdeInsets([10])
///   child: //...
/// )
/// ```

EdgeInsets genEdgeInsets(List<double> valueList) {
  int len = valueList.length;
  EdgeInsets result;
  switch (len) {
    case 1:
      result = EdgeInsets.all(valueList.elementAt(0));
      break;
    case 2:
      result = EdgeInsets.symmetric(
        vertical: valueList.elementAt(0),
        horizontal: valueList.elementAt(1),
      );
      break;
    case 3:
      result = EdgeInsets.only(
        top: valueList[0],
        right: valueList.elementAt(1),
        left: valueList.elementAt(1),
        bottom: valueList.elementAt(2),
      );
      break;
    case 4:
      result = EdgeInsets.only(
        top: valueList[0],
        right: valueList.elementAt(1),
        bottom: valueList.elementAt(2),
        left: valueList.elementAt(3),
      );
      break;
    default:
      result = const EdgeInsets.all(5);
      break;
  }
  return result;
}
