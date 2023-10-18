import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/count_model.dart';

class CountPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
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

class CountButton4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.read<CountModel>();
    return FloatingActionButton(
      onPressed: model.incrementCounter,
      child: const Icon(Icons.add),
    );
  }
}
