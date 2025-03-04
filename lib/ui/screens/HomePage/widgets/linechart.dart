import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  const LineChart(
      {super.key, required this.data, required this.name, required this.quant});

  final String name;
  final List data;
  final String quant;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [];
    for (int i = 0; i < widget.data.length; i++) {
      data.add(_ChartData(widget.data[i][widget.name],
          (widget.data[i][widget.quant] as int).toDouble()));
    }
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.black54,
      borderColor: Colors.black54,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 1000, interval: 100),
      tooltipBehavior: _tooltip,
      series: _lineSeries(),
    );
  }

  List<CartesianSeries<_ChartData, String>> _lineSeries() {
    return <CartesianSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
        dataSource: data,
        xValueMapper: (_ChartData data, _) => data.x,
        yValueMapper: (_ChartData data, _) => data.y,
        name: 'Material',
        color: Colors.blue,
        markerSettings: const MarkerSettings(
          isVisible: true,
          color: Colors.blue,
          shape: DataMarkerType.circle,
          borderColor: Colors.white,
          borderWidth: 2,
        ),
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.outer,
          textStyle: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}