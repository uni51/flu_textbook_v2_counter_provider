import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/color_model.dart';
import 'package:counter_provider/count_model.dart';

class CountPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (_) => CountModel()),
        ChangeNotifierProvider<ColorModel>(create: (_) => ColorModel()),
      ],
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
    final count = context.select<CountModel, int>(
      (CountModel model) => model.count,
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
    ));
  }
}

class CountButton4 extends StatelessWidget {
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
