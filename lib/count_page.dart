import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/count_model.dart';

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        body: Center(
          child: Consumer<CountModel>(builder: (context, model, child) {
            final count = model.count;
            return Text(
              '$count',
              style: const TextStyle(
                fontSize: 80,
                color: Colors.red,
              ),
            );
          }),
        ),
        floatingActionButton:
            Consumer<CountModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: model.incrementCounter,
            child: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
