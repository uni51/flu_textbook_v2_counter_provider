import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/color_model.dart';
import 'package:counter_provider/count_model.dart';

class CountPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (_) => CountModel()),
        ChangeNotifierProvider<ColorModel>(create: (_) => ColorModel()),
      ],
      child: Scaffold(
        body: CountPage3Body(),
        floatingActionButton: CountButton3(),
      ),
    );
  }
}

class CountPage3Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CountModel>();
    final count = model.count;
    final counterColor = context.watch<ColorModel>().counterColor;
    return Center(
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 80,
          color: counterColor,
        ),
      ),
    );
  }
}

class CountButton3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<CountModel>();
    return FloatingActionButton(
      onPressed: () {
        model.incrementCounter();
        context.read<ColorModel>().randomColor();
      },
      child: const Icon(Icons.add),
    );
  }
}
