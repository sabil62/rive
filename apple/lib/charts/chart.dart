import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './chartImport.dart';

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
        // colorFn: (Cities city, _) =>
        //     charts.ColorUtil.fromDartColor(city.color(city.rain)),
        // labelAccessorFn: (Cities row, _) => '${row.rain}'),
        labelAccessorFn: (Cities row, _) => '${row.rain}: ${row.name}',
      )
    ];
  }

  generateAnotherData() {
    final data = [
      new LinearSales(0, 150),
      new LinearSales(1, 75),
      new LinearSales(2, 120),
      new LinearSales(3, 50),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
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
          Container(
            height: 350,
            color: Colors.brown.withOpacity(0.3),
            child: charts.PieChart(generateData(),
                animate: true,
                animationDuration: Duration(milliseconds: 2200),
                defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(height: 220, child: DonutAutoLabelChart.withSampleData()),
          Container(
            height: 260,
            child: DonutAutoLabelChart(
              generateAnotherData(),
              animate: true,
            ),
          )
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

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
