import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChart extends StatefulWidget {
  const CircularChart({super.key});

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  late final TooltipBehavior _tooltip;

  late final List<_ChartData> data;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),

    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        tooltipBehavior: _tooltip,
        series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              innerRadius: '60%',
              // Set inner radius (optional)
              explode: true,
              // Explode segments (optional)
              explodeIndex: 0,
              // Index of segment to explode (optional)
              explodeOffset: '15%',
              // Explode offset (optional)
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                // Show data labels (optional)
                labelPosition: ChartDataLabelPosition.outside,
                // Label position (optional)
                textStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Label text style (optional))
              ))
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
