import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/color_model.dart';
import 'package:counter_provider/count_model.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (_) => CountModel()),
        ChangeNotifierProvider<ColorModel>(create: (_) => ColorModel()),
      ],
      child: Scaffold(
        body: Center(
          child: Consumer<CountModel>(
            builder: (context, model, child) {
              final count = model.count;
              final counterColor = Provider.of<ColorModel>(context).counterColor;

              return Text(
                '$count',
                style: TextStyle(
                  fontSize: 80,
                  color: counterColor,
                ),
              );
            },
          ),
        ),
        floatingActionButton: Consumer<CountModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {
                model.incrementCounter();
                Provider.of<ColorModel>(context, listen: false).randomColor();
              },
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
