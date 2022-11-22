import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///En ejeX van las categorias y en ejeY los valores para cada categoria
class DonaGenerico extends StatefulWidget {
  final String titulo;
  final List lista;
  final String unidad;
  final String ejeX;
  final MaterialColor? color;
  const DonaGenerico({Key? key,
  required this.titulo,
  required this.lista,
  required this.unidad, required this.ejeX, this.color,
  }) : super(key: key);

  @override
  State<DonaGenerico> createState() => _DonaGenericoState();
}

class _DonaGenericoState extends State<DonaGenerico> {
  late TooltipBehavior _tooltip;
  late List<dynamic> items;


  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, format: 'point.x : point.y${widget.unidad}');
    items = widget.lista.map((e) => ItemsChart(
      x: e.x, 
      y: e.y, 
      texto: e.texto, 
      color: e.color ?? Colors.primaries[Random().nextInt(Colors.primaries.length)],)).toList();
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
          dataSource: items,
          pointColorMapper: (dynamic data, _) => data.color,
          xValueMapper: (dynamic data, _) => data.x,
          yValueMapper: (dynamic data, _) => data.y,
          dataLabelMapper: (dynamic data, _) => data.texto,
          dataLabelSettings: const DataLabelSettings(isVisible: true))
    ];
  }
}

class ItemsChart {
  final String x;
  final num y;
  final String texto;
  final MaterialColor color;
  const ItemsChart({Key? key,
  required this.x,
  required this.y,
  required this.texto,
  required this.color, 
  });

}