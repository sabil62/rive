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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Builder(builder: (context) {
                return Text(
                  context.watch<Counter>().count.toString(),
                  style: TextStyle(fontSize: 38),
                );
              }),
              SizedBox(
                height: 30,
              ),
              Builder(
                  builder: (context) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            onPressed: () =>
                                context.read<Counter>().increment(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                size: 36,
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () =>
                                context.read<Counter>().decrement(),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.remove,
                                size: 36,
                              ),
                            ),
                          )
                        ],
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
