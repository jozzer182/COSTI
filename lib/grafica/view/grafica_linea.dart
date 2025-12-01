import 'package:costii/live/model/live_list.dart';
import 'package:costii/live/model/live_reg.dart';
import 'package:costii/resources/to_mcop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:statistics/statistics.dart';

import '../../bloc/main_bloc.dart';

class GraficaLinea extends StatefulWidget {
  final List<LiveReg> list;
  const GraficaLinea({
    super.key,
    required this.list,
  });

  @override
  State<GraficaLinea> createState() => _GraficaLineaState();
}

class _GraficaLineaState extends State<GraficaLinea> {
  Color colorBDG = const Color.fromRGBO(5, 85, 250, 1.0);
  Color colorLive = const Color.fromRGBO(0, 140, 90, 1.0);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state.liveList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        LiveList? liveList = state.liveList;
        // List<LiveReg> list = liveList!.list;
        Map<int, int> live = liveList!.mAcum(widget.list);
        Map<int, int> bdg = liveList.mAcumBDG(widget.list);
        // bdg.addEntries([const MapEntry(-1, 0)]);
        // live.addEntries([const MapEntry(-1, 0)]);
        int max = [live[12]!, bdg[12]!].statistics.max;
        max = (max * 1.1).toInt();

        return Container(
          height: 500,
          // clipBehavior: Clip.antiAlias,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   border: Border.all(
          //     color: Colors.grey,
          //   ),
          // ),
          padding: const EdgeInsets.only(top: 16),
          child: LineChart(
            LineChartData(
              maxY: max.toDouble(),
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  dotData: const FlDotData(show: false),
                  color: const Color.fromRGBO(5, 85, 250, 1.0),
                  spots: bdg.entries
                      .map(
                        (e) => FlSpot(
                          e.key.toDouble(),
                          e.value.toDouble(),
                        ),
                      )
                      .toList(),
                ),
                LineChartBarData(
                  dotData: const FlDotData(show: false),
                  color: const Color.fromRGBO(0, 140, 90, 1.0),
                  spots: live.entries
                      .map(
                        (e) => FlSpot(
                          e.key.toDouble(),
                          e.value.toDouble(),
                        ),
                      )
                      .toList(),
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.white,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots
                        .map(
                          (e) {
                            String title = '';
                            if (e.bar.color == colorBDG) {
                              title = 'BDG';
                            } else {
                              title = 'LIVE';
                            }
                            return LineTooltipItem(
                            '$title: ${toMMCOP(e.y.toInt())}MMCOP',
                            TextStyle(color: e.bar.color),
                          );
                          },
                        )
                        .toList();
                  },
                ),
              ),
              gridData: const FlGridData(
                show: true,
                verticalInterval: 1,
                horizontalInterval: 100000000000,
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text(value.toString()),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 80,
                    interval: 100000000000,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        child: Text('${toMMCOP(value.toInt())} MMCOP'),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
