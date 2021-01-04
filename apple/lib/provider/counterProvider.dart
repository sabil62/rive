import 'package:provider/provider.dart';
import 'counter.dart';
import 'package:flutter/material.dart';

class CounterProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counter>(create: (context) => Counter())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider Simple'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Builder(builder: (context) {
              return Text(context.watch<Counter>().count.toString());
            })
          ],
        ),
      ),
    );
  }
}
