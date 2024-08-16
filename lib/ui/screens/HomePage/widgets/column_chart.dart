import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart(
      {super.key, required this.data, required this.name, required this.quant});

  final String name;
  final List data;
  final String quant;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  late List<_ChartData> data;

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [];
    for (int i = 0; i < widget.data.length; i++) {
      data.add(_ChartData(widget.data[i][widget.name],
          (widget.data[i][widget.quant] as int).toDouble()));
    }
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderColor: Colors.black54,
      borderColor: Colors.black54,
      primaryXAxis: const CategoryAxis(
        maximum: 8,
      ),
      primaryYAxis: const NumericAxis(minimum: 0, maximum: 1000, interval: 50),
      tooltipBehavior: _tooltip,
      series: _columnseries(),
    );
  }

  List<CartesianSeries<_ChartData, String>> _columnseries() {
    return <CartesianSeries<_ChartData, String>>[
      ColumnSeries<_ChartData, String>(
          trackColor: Colors.grey,
          trackBorderColor: Colors.grey,
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          name: 'material',
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.red.shade300,
            Colors.red.shade300,
            Colors.red.shade300,
            Colors.red.shade200,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          color: Colors.black,
          borderColor: Colors.black54,
          // Border color
          borderWidth: 0,
          // Border width
          borderRadius: BorderRadius.circular(0),
          // Corner radius
          // Customizing data labels (optional)
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.outer,
            textStyle: TextStyle(fontSize: 12, color: Colors.black),
          ))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
