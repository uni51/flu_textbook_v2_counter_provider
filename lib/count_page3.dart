import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/count_model.dart';

class CountPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
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
    return Center(
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 80,
          color: Colors.red,
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
      onPressed: model.incrementCounter,
      child: const Icon(Icons.add),
    );
  }
}
