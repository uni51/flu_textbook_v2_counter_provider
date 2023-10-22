import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/color_model.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorModel>(
      create: (_) => ColorModel(),
      child: Scaffold(
        body: Center(
          child: Consumer<ColorModel>(builder: (context, model, child) {
            final count = model.count;
            return Builder(
              builder: (BuildContext context) {
                final counterColor = Provider.of<ColorModel>(context).counterColor;
                return Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 80,
                    color: counterColor,
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton:
            Consumer<ColorModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () {
              model.incrementCounter();
              model.randomColor();
            },
          child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
