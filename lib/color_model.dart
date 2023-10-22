import 'dart:math';
import 'package:flutter/material.dart';
import 'count_model.dart';

class ColorModel extends CountModel {
  Color counterColor = Colors.red;

  void randomColor() {
    counterColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}