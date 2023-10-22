import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/color_model.dart';

class CountPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorModel>(
      create: (_) => ColorModel(),
      child: Scaffold(
        body: CountPage4Body(),
        floatingActionButton: CountButton4(),
      ),
    );
  }
}

class CountPage4Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = context.select<ColorModel, int>(
          (ColorModel model) => model.count,
    );
    final counterColor = context.select<ColorModel, Color>(
          (ColorModel model) => model.counterColor,
    );
    return Center(
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 80,
          color: counterColor,
        ),
      )
    );
  }
}

class CountButton4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<ColorModel>();
    return FloatingActionButton(
      onPressed: () {
        model.incrementCounter();
        model.randomColor();
      },
      child: const Icon(Icons.add),
    );
  }
}
