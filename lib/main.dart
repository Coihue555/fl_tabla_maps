import 'package:flutter/material.dart';
import 'package:fl_tabla_maps/widgets/donas_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List lista = [
            const DatosPrueba(x: 'Chlorine', y: 55, texto: '55%',),
            const DatosPrueba(x: 'Sodium', y: 31, texto: '31%', color: Colors.green),
            const DatosPrueba(x: 'Magnesium', y: 7.7, texto: '7.7%', color: Colors.red),
            const DatosPrueba(x: 'Sulfur', y: 3.7, texto: '3.7%', color: Colors.yellow),
            const DatosPrueba(x: 'Sulfur', y: 3.7, texto: '3.7%', color: Colors.grey),
            const DatosPrueba(x: 'Calcium', y: 1.2, texto: '1.2%',),
            const DatosPrueba(x: 'Others', y: 1.4, texto: '1.4%',),
          ];

    
    


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grafico de Dona Genérico'),
        ),
        body: Center(
          child: DonaGenerico(
            titulo: 'Grafico', 
            lista: lista,
            unidad: '%',
            ejeX: 'x',
            ),
        ),
      )
    );
  }
}

class DatosPrueba {
  final String x;
  final num y;
  final String texto;
  final MaterialColor? color;
  const DatosPrueba({Key? key,
  required this.x,
  required this.y,
  required this.texto, this.color, 
  });
}