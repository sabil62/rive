import 'package:apple/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'players.dart';

class PlayersProvider extends StatelessWidget {
  //for total length of class
  Players playerss = Players();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Players>(create: (context) => Players()),
        ChangeNotifierProvider<Counter>(create: (context) => Counter())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider with class'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text('The counter is:'),
              Builder(
                  builder: (context) => Text(
                        context.watch<Counter>().count.toString(),
                        style: TextStyle(
                            fontSize: 86, fontWeight: FontWeight.bold),
                      )),
              Text(
                'Upper and Lower are different Providers',
                style: TextStyle(fontSize: 24),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: playerss.totalPlayer.length,
                itemBuilder: (BuildContext context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 9),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(18)),
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Builder(
                            builder: (context) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      context
                                          .watch<Players>()
                                          .totalPlayer[index]
                                          .name,
                                      style: font(),
                                    ),
                                    Text(
                                      context
                                          .watch<Players>()
                                          .totalPlayer[index]
                                          .salary
                                          .toString(),
                                      style: font(),
                                    ),
                                    Text(
                                      context
                                          .watch<Players>()
                                          .totalPlayer[index]
                                          .rating
                                          .toString(),
                                      style: font(),
                                    )
                                  ],
                                )),
                        Builder(
                            builder: (context) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(
                                      onPressed: () => context
                                          .read<Players>()
                                          .incrementSalary(index),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    RaisedButton(
                                      onPressed: () => context
                                          .read<Players>()
                                          .decrementSalary(index),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.remove,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text('For rating *2'),
                                        RaisedButton(
                                          onPressed: () => context
                                              .read<Players>()
                                              .multiplyRatings(index),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              '*2',
                                              style: font(),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle font() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }
}
