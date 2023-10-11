import 'package:auto_route/auto_route.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';
import 'package:deedee/ui/page/chart_page/search_request_interactor.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../repository/service_request_repository.dart';
import '../../../services/helper.dart';
import '../../global_widgets/deedee_appbar.dart';
import '../../global_widgets/profile_menu_slider.dart';
import '../../request_screen/bloc/service_request_bloc.dart';
import 'chart_type.dart';
import 'line_chart_bloc/line_chart_bloc.dart';

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
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
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
    final PanelController _controller = PanelController();
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final serviceRequestInteractor = ServiceRequestInteractor(
      user.email,
      locator.get<ServiceRequestRepository>(),
    );

    return Scaffold(
      appBar: DeeDeeAppBar(
        title: locale.chart,
        controller: _controller,
        child: const Icon(Icons.menu),
      ),
      body:
          // Center(),
          Stack(
        children: [
          FutureBuilder(
            future: serviceRequestInteractor.serviceRequestsByDates,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LineChartWidget(requests: snapshot.data!);
              } else if (snapshot.hasError) {
                return const Text('Sorry, something went wrong');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          ProfileMenuSlider(
            context,
            controller: _controller,
            user: user,
          ),
        ],
      ),
    );
  }
}

List<String> list = ['Bar', 'Lines'];

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({required this.requests, Key? key}) : super(key: key);

  final Map<DateTime, int> requests;

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    final locale =
        context.read<AccountBloc>().appLocal ?? Localizations.localeOf(context);
    final chartBloc = LineChartBloc();

    return BlocConsumer<LineChartBloc, LineChartState>(
      bloc: chartBloc,
      listener: (context, state) {
        if (state is SelectedChartTypeState) {
          state.chartType.value;
        }
        if (state is LineChartInitial) {
          state.chartType.value;
        }
      },
      builder: (context, state) {
        if (state is LineChartInitial) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: state.chartType.value,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? chartType) {
                      chartBloc.add(LoadLineChartEvent(
                          type: ChartType.fromString(chartType!)));
                    },
                    items: list.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                  GraphLinesAndBarsWidget(
                    requests: widget.requests,
                    value: state.chartType.value,
                  ),
                ],
              ),
            ),
          );
        }

        if (state is SelectedChartTypeState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: state.chartType.value,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? chartType) {
                      chartBloc.add(LoadLineChartEvent(
                          type: ChartType.fromString(chartType!)));
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  GraphLinesAndBarsWidget(
                    requests: widget.requests,
                    value: state.chartType.value,
                  ),
                ],
              ),
            ),
          );
        }
        if (state is FailureSelectedChartState) {
          return const Center(
            child: Text('Sorry, something went wrong'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class GraphLinesAndBarsWidget extends StatefulWidget {
  const GraphLinesAndBarsWidget(
      {super.key, required this.requests, required this.value});
  final Map<DateTime, int> requests;
  final String? value;

  @override
  State<GraphLinesAndBarsWidget> createState() =>
      _GraphLinesAndBarsWidgetState();
}

class _GraphLinesAndBarsWidgetState extends State<GraphLinesAndBarsWidget> {
  @override
  Widget build(BuildContext context) {
    final locale =
        context.read<AccountBloc>().appLocal ?? Localizations.localeOf(context);

    return widget.value == 'Lines'
        ? Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: LineChart(
                  LineChartData(
                      lineBarsData: lineChartBarData,
                      borderData: FlBorderData(
                        border: const Border(
                            bottom: BorderSide(), left: BorderSide()),
                      ),
                      titlesData: titlesLineData(locale.toString())),
                  swapAnimationCurve: Curves.linear,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: LineChart(
                  LineChartData(
                      lineBarsData: lineChartBarData,
                      borderData: FlBorderData(
                        border: const Border(
                            bottom: BorderSide(), left: BorderSide()),
                      ),
                      titlesData: titlesLineData(locale.toString())),
                  swapAnimationCurve: Curves.linear,
                ),
              )
            ],
          )
        : Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: RotatedBox(
                  quarterTurns: 0,
                  child: BarChart(
                    BarChartData(

                        //   ----------------------

                        titlesData: titlesData(locale.toString()),
                        barTouchData: barTouchData,
                        borderData: borderData,
                        gridData: FlGridData(show: false),
                        alignment: BarChartAlignment.spaceBetween,
                        groupsSpace: 20,
                        barGroups: barGroups),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: RotatedBox(
                  quarterTurns: 0,
                  child: BarChart(
                    BarChartData(

                        //   ----------------------

                        titlesData: titlesData(locale.toString()),
                        barTouchData: barTouchData,
                        borderData: borderData,
                        gridData: FlGridData(show: false),
                        alignment: BarChartAlignment.spaceBetween,
                        groupsSpace: 20,
                        barGroups: barGroups),
                  ),
                ),
              ),
            ],
          );
  }

  List<LineChartBarData> get lineChartBarData {
    return [
      LineChartBarData(
        color: Colors.deepPurpleAccent,
        spots: [
          for (int i = 0; i < widget.requests.entries.length; i++)
            FlSpot(
              i.toDouble(),
              widget.requests.values.toList()[i].toDouble(),
              
            ),
        ],
      )
    ];
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          fitInsideHorizontally: true,
          //tooltipHorizontalAlignment:FLHorizontalAlignment.center,
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(5),
          tooltipMargin: 1,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  // LineTouchData get lineTouchData => LineTouchData(
  //       enabled: false,
  //       touchTooltipData: LineTouchTooltipData(
  //         fitInsideHorizontally: true,
  //         //tooltipHorizontalAlignment:FLHorizontalAlignment.center,
  //         tooltipBgColor: Colors.transparent,
  //         tooltipPadding: const EdgeInsets.all(5),
  //         tooltipMargin: 1,
  //         getTooltipItems: (touchedSpots) {
  //           return touchedSpots
  //               .map(
  //                 (e) => LineTooltipItem(
  //                     e.y.toString(), TextStyle(color: Colors.black, fontSize: 10),),
  //               )
  //               .toList();
  //         },
  //       ),
  //     );

  FlTitlesData titlesLineData(String locale) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          //rotateAngle: 90,
          showTitles: true,
          reservedSize: 60,
          getTitlesWidget: (double value, TitleMeta meta) {
            const style = TextStyle(
              color: Colors.black,
              fontSize: 15,
            );
            String text = DateFormat.MMM(locale)
                .format(widget.requests.keys.toList()[value.toInt()]);

            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  textAlign: TextAlign.start,
                  text,
                  style: style,
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: true, reservedSize: 30),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  FlTitlesData titlesData(String locale) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          //rotateAngle: 90,
          showTitles: true,
          reservedSize: 60,
          getTitlesWidget: (double value, TitleMeta meta) {
            const style = TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            );
            String text = DateFormat.MMM(locale)
                .format(widget.requests.keys.toList()[value.toInt()]);

            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  textAlign: TextAlign.start,
                  text,
                  style: style,
                ),
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups {
    return [
      for (int i = 0; i < widget.requests.entries.length; i++)
        BarChartGroupData(
          barsSpace: 10,
          x: i,
          barRods: [
            BarChartRodData(
                toY: widget.requests.values.toList()[i].toDouble(),
                width: 20,
                color: AppColors.fiolet,
                borderRadius: BorderRadius.circular(4)),
          ],
          showingTooltipIndicators: [0],
        )
    ];
  }
}
