import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter_provider/count_model.dart';

class CountPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        body: CountPage2Body(),
      ),
    );
  }
}

class CountPage2Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CountModel>(context);
    final count = model.count;
    return Scaffold(
      body: Center(
        child: Text(
          '$count',
          style: const TextStyle(
            fontSize: 80,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: model.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
