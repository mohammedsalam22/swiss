import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:swis_warehouse/ui/screens/HomePage/widgets/chart_data.dart';

class CircularChart extends StatefulWidget {
  const CircularChart({
    super.key,
    required this.data,
  });

  final List<chartdata> data;

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart> {
  late final TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.data;
    return SfCircularChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        series: _circularseries());
  }

  List<CircularSeries<chartdata, String>> _circularseries() {
    return <CircularSeries<chartdata, String>>[
      DoughnutSeries<chartdata, String>(
          pointColorMapper: (chartdata data, _) => data.color,
          dataSource: widget.data,
          xValueMapper: (chartdata data, _) => data.name,
          yValueMapper: (chartdata data, _) => data.value,
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
    ];
  }
}
