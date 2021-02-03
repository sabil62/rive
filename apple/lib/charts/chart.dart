import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartApp extends StatelessWidget {
  generateData() {
    var data = [
      Cities("Kathmandu", 23),
      Cities("Tokyo", 10),
      Cities("Britianica", 23),
      Cities("New York", 32),
      Cities("London", 40)
    ];
    return [
      charts.Series(
          data: data,
          id: "City Rain",
          domainFn: (Cities cit, _) => cit.name,
          measureFn: (Cities city, _) => city.rain,
          colorFn: (Cities city, _) =>
              charts.ColorUtil.fromDartColor(city.color(city.rain))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart PieChart"),
      ),
      body: ListView(
        children: [
          charts.PieChart(generateData(),
              animate: true,
              animationDuration: Duration(milliseconds: 2200),
              defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60)),
        ],
      ),
    );
  }
}

class Cities {
  String name;
  int rain;
  color(int rainn) {
    if (rainn <= 10) {
      return Colors.yellow;
    } else if (rainn <= 20) {
      return Colors.brown;
    } else if (rainn <= 25) {
      return Colors.green;
    } else if (rainn <= 33) {
      return Colors.pink;
    } else {
      return Colors.purple;
    }
  }

  Cities(this.name, this.rain);
}
