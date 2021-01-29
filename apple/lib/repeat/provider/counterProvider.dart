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
        body: ListView(
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
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Builder(
                        builder: (BuildContext context) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    context.watch<Players>().player[index].name,
                                    style: textstyle(26.0)),
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
                                    onPressed: () => context
                                        .read<Players>()
                                        .increments(index),
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
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade100,
                              Colors.orange.shade600
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                        // color: Colors.orange.withOpacity(0.3),
                        // border: Border(top: 2.0,left: 2,right: 3,bottom: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(2, 2),
                              blurRadius: 10),
                        ]),
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
