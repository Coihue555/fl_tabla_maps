import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DonaGenerico extends StatefulWidget {
  final String titulo;
  final List lista;
  const DonaGenerico({Key? key, 
  required this.titulo,
  required this.lista,
  }) : super(key: key);

  @override
  State<DonaGenerico> createState() => _DonaGenericoState();
}

class _DonaGenericoState extends State<DonaGenerico> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _buildDefaultDoughnutChart();
  }

  SfCircularChart _buildDefaultDoughnutChart() {
    return SfCircularChart(
      title: ChartTitle(text: widget.titulo),
      legend: Legend(
          isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: _getDefaultDoughnutSeries(),
      tooltipBehavior: _tooltip,
    );
  }

  List<DoughnutSeries<dynamic, String>> _getDefaultDoughnutSeries() {
    return <DoughnutSeries<dynamic, String>>[
      DoughnutSeries<dynamic, String>(
          radius: '80%',
          explode: true,
          explodeOffset: '10%',
          dataSource: widget.lista,
          xValueMapper: (dynamic data, _) => data.x,
          yValueMapper: (dynamic data, _) => data.y,
          dataLabelMapper: (dynamic data, _) => data.texto,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
}

