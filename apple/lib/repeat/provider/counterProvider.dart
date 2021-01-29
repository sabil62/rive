import 'package:apple/repeat/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './players.dart';

class CounterProviders extends StatelessWidget {
  //for listview.builder
  Players playering = Players();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Counters>(
          create: (context) => Counters(),
        ),
        ChangeNotifierProvider<Players>(
          create: (context) => Players(),
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
            ),
            //---------------------------------------------Another (Players) class--------------------------------------
            Divider(
              height: 3,
              color: Colors.black,
              indent: 2,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount:
                  playering.player.length, //playering is instance of class
              itemBuilder: (context, index) {
                return Container(
                  child: Builder(
                    builder: (BuildContext context) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(context.watch<Players>().player[index].name,
                                style: textstyle(22.0)),
                            Text(
                              context
                                  .watch<Players>()
                                  .player[index]
                                  .power
                                  .toString(),
                              style: textstyle(32.0),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: RaisedButton(
                                child: Icon(
                                  Icons.add,
                                  size: 45,
                                ),
                                onPressed: () =>
                                    context.read<Players>().increments(index),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(12.0),
                                child: RaisedButton(
                                  onPressed: () {
                                    return context
                                        .read<Players>()
                                        .decrements(index);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    size: 45,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
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
