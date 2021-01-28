import 'package:apple/repeat/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counters>(
          create: (context) => Counters(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counters"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Builder(
              builder: (context) => Text(
                context.watch<Counters>().count.toString(),
                style: textstyle(26.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      context.read<Counters>().increment();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.add, size: 45),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  RaisedButton(
                    onPressed: () {
                      context.read<Counters>().decrement();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.remove,
                        size: 45,
                        color: Colors.orange,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle textstyle(font) {
    return TextStyle(
        fontSize: font, color: Colors.black45, fontWeight: FontWeight.w600);
  }
}
