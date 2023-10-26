import 'dart:math';
import 'package:flutter/material.dart';

class ColorModel extends ChangeNotifier {
  Color counterColor = Colors.red;

  void randomColor() {
    counterColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}