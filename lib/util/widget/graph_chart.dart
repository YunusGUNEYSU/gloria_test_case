import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gloria_test_case/core/extension/index.dart';
import 'package:gloria_test_case/feature/home/model/people_count_model.dart';

class GraphChart extends StatefulWidget {
  const GraphChart({super.key, required this.peopleCounts, required this.counts});
  final List<PeopleCountModel> peopleCounts;
  final List<double> counts;

  @override
  State<GraphChart> createState() => _GraphChartState();
}

class _GraphChartState extends State<GraphChart> {
  final List<Color> gradientColors = [Colors.deepPurple.shade100, Colors.deepPurple.shade200];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      width: context.width * 0.4,
      child: LineChart(LineChartData(
          gridData: const FlGridData(show: false),
          backgroundColor: context.colorSheme.primary,
          titlesData: const FlTitlesData(
            show: true,
            rightTitles: AxisTitles(drawBelowEverything: false),
            topTitles: AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(drawBelowEverything: false),
          ),
          maxX: widget.peopleCounts.map((e) => e.createdTime).length.toDouble(),
          maxY: widget.counts[0],
          minX: 0,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
                barWidth: 3,
                isCurved: true,
                belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(colors: gradientColors, stops: const [0.3, 1])),
                dotData: const FlDotData(show: true),
                gradient: RadialGradient(colors: gradientColors),
                spots: List.generate(widget.peopleCounts.length, (index) {
                  final people = widget.peopleCounts[index];

                  return FlSpot(index.toDouble(), people.peopleCount.toDouble());
                }))
          ])),
    );
  }
}
