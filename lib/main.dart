import 'package:fl_tabla_maps/widgets/donas_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List lista = [
            const ItemChart(x: 'Chlorine', y: 55, texto: '55%'),
            const ItemChart(x: 'Sodium', y: 31, texto: '31%'),
            const ItemChart(x: 'Magnesium', y: 7.7, texto: '7.7%'),
            const ItemChart(x: 'Sulfur', y: 3.7, texto: '3.7%'),
            const ItemChart(x: 'Calcium', y: 1.2, texto: '1.2%'),
            const ItemChart(x: 'Others', y: 1.4, texto: '1.4%'),
          ];


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grafico de Dona Genérico'),
        ),
        body: Center(
          child: DonaGenerico(titulo: 'Grafico', lista: lista,),
        ),
      )
    );
  }
}

class ItemChart {
  final String x;
  final num y;
  final String texto;
  const ItemChart({Key? key,
  required this.x,
  required this.y,
  required this.texto, 
  });

}