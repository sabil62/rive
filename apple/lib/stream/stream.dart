import 'package:flutter/material.dart';

class StreamAppSimple extends StatefulWidget {
  @override
  _StreamAppSimpleState createState() => _StreamAppSimpleState();
}

class _StreamAppSimpleState extends State<StreamAppSimple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red.withOpacity(0.4),
              height: 60,
              child: StreamBuilder(
                initialData: 8,
                stream: getStream(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.red.withOpacity(0.4),
              height: 60,
              child: StreamBuilder(
                stream: getName(),
                initialData: 'lion',
                builder: (context, snapshot) {
                  return Text(snapshot.data,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Stream getStream() async* {
    yield* Stream.periodic(
        Duration(
          milliseconds: 1200,
        ), (int a) {
      return a++;
    });
  }

  List<String> datas = [
    "aman",
    "bbbb",
    "cman",
    "dddd",
    "eman",
    "fmffan",
    "gman",
    "hman",
  ];
  Stream<String> getName() async* {
    for (var i = 0; i < datas.length; i++) {
      await Future.delayed(Duration(milliseconds: 2000));
      yield datas[i];
    }
  }
}
