import 'package:deedee/injection.dart';
import 'package:deedee/ui/page/account/account_bloc.dart';
import 'package:deedee/ui/page/chart_page/search_request_interactor.dart';
import 'package:deedee/ui/theme/colors.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../repository/service_request_repository.dart';
import '../../global_widgets/deedee_appbar.dart';
import '../../global_widgets/profile_menu_slider.dart';

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

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({required this.requests, Key? key}) : super(key: key);

  final Map<DateTime, int> requests;

  @override
  Widget build(BuildContext context) {
    final locale =
        context.read<AccountBloc>().appLocal ?? Localizations.localeOf(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        //scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
        ),
      ),
    );
  }

// --------------------------

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
                .format(requests.keys.toList()[value.toInt()]);

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
      for (int i = 0; i < requests.entries.length; i++)
        BarChartGroupData(
          barsSpace: 10,
          x: i,
          barRods: [
            BarChartRodData(
                toY: requests.values.toList()[i].toDouble(),
                width: 20,
                color: AppColors.fiolet,
                borderRadius: BorderRadius.circular(4)),
          ],
          showingTooltipIndicators: [0],
        )
    ];
  }
}
