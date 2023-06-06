import 'dart:math';

import 'package:deedee/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LineChartPage extends StatefulWidget {
  const LineChartPage({super.key});

  @override
  State<LineChartPage> createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(locale.chart),
          backgroundColor: AppColors.fiolet,
        ),
        body: LineChartWidget());
  }
}

class DataItem {
  int x;
  int y1;

  DataItem({
    required this.x,
    required this.y1,
  });
}

class LineChartWidget extends StatelessWidget {
  LineChartWidget({Key? key}) : super(key: key);

  final List<DataItem> _myData = List.generate(
    30,
    (index) => DataItem(
      x: index, // должны быть дни недели
      y1: Random().nextInt(50), // статистика просмотров
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BarChart(
            BarChartData(
              maxY: 70,
                borderData: FlBorderData(
                    border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                )),
                groupsSpace: 10,
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(toY: 35, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(toY: 29, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(toY: 24, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(toY: 32, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 5, barRods: [
                    BarChartRodData(toY: 33, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(toY: 37, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 7, barRods: [
                    BarChartRodData(toY: 39, width: 15, color: Colors.amber),
                  ]),
                  BarChartGroupData(x: 8, barRods: [
                    BarChartRodData(toY: 31, width: 15, color: Colors.amber),
                  ])]
                    .toList()),
          ),
        ),
      ),
    );
  }
}