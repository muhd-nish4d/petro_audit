import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/provider/graph_provider.dart';
import 'package:provider/provider.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height * .4,
      child: Consumer<GraphProvider>(builder: (context, value, child) {
        if (value.status == CallStatus.success) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: screenSize.height * .3,
                child: BarChart(
                  BarChartData(
                      maxY: 100,
                      minY: 0,
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: const FlTitlesData(
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false))),
                      barGroups: value.graphDatas!.map((e) {
                        return BarChartGroupData(x: e.count, barRods: [
                          BarChartRodData(
                              toY: e.count.toDouble(),
                              color: Color(int.parse(
                                  '0xFF${e.colour.substring(1, 7).toUpperCase()}')),
                              width: 30,
                              borderRadius: BorderRadius.zero)
                        ]);
                      }).toList()),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var datas = value.graphDatas![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Card(
                            color: Color(int.parse(
                                '0xFF${datas.colour.substring(1, 7).toUpperCase()}')),
                            child: iconSelector(datas.icon),
                          ),
                          const SizedBox(width: 5),
                          Text(datas.item)
                        ],
                      ),
                    );
                  },
                  itemCount: value.graphDatas!.length,
                ),
              )
            ],
          );
        } else if (value.status == CallStatus.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Filed to show'));
        }
      }),
    );
  }

  Icon iconSelector(String icon) {
    if (icon == 'refresh-outline') {
      return const Icon(Icons.refresh_outlined);
    } else if (icon == 'more-horizontal-outline') {
      return const Icon(Icons.more_horiz_outlined);
    } else if (icon == 'checkmark-circle-outline') {
      return const Icon(Icons.check_circle_outline);
    } else {
      return const Icon(Icons.arrow_right_alt_outlined);
    }
  }
}
