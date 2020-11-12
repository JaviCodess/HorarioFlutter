import 'package:calendar/hora.dart';
import 'package:flutter/material.dart';
import 'package:calendar/model/cuadrado.dart';

void main() {
  var cu = new MisDatos();
  cu.actividades[0] = ['', '', '', '', '', '', '', '', ''];
  cu.actividades[1] = ['', '', '', '', '', '', '', '', ''];
  cu.actividades[2] = ['', '', '', '', '', '', '', '', ''];
  cu.actividades[3] = ['', '', '', '', '', '', '', '', ''];
  cu.actividades[4] = ['', '', '', '', '', '', '', '', ''];
  cu.actividades[5] = ['', '', '', '', '', '', '', '', ''];

  cu.colores[0] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  cu.colores[1] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  cu.colores[2] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  cu.colores[3] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  cu.colores[4] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  cu.colores[5] = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  runApp(MyApp(data: cu));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({Key key, this.data}) : super(key: key);
  MisDatos data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', data: data),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.data}) : super(key: key);

  final String title;
  final MisDatos data;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color;
  static int ncont;
  static int ncont2;
  static String texto;
  static String nhoras;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
            children: List.generate(6, (index) {
          return Column(
            children: List.generate(8, (index2) {
              if (index2 == 0) {
                return Container(
                  child: Text(widget.data.dias[index]),
                  color: Colors.teal[index * 100],
                  width: 55,
                  height: 55,
                  margin:
                      const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                );
              }
              if (index == 0 && index2 != 0) {
                return Container(
                  child: Text(widget.data.horas[index2 - 1]),
                  color: Colors.teal,
                  width: 55,
                  height: 55,
                  margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                );
              } else {
                if (widget.data.actividades[index][index2] ==
                        widget.data.actividades[index][index2 + 1] &&
                    widget.data.actividades[index][index2] != '') {
                  return Container(
                    child: FlatButton(
                      child: Text(widget.data.actividades[index][index2]),
                      onPressed: () {
                        xd(index, index2);
                      },
                    ),
                    color: widget.data.colores[index][index2],
                    key: UniqueKey(),
                    width: 55,
                    height: 120,
                    margin: const EdgeInsets.only(top: 5.0),
                  );
                } else {
                  return Container(
                    child: FlatButton(
                      child: Text(widget.data.actividades[index][index2]),
                      onPressed: () {
                        xd(index, index2);
                      },
                    ),
                    color: widget.data.colores[index][index2],
                    key: UniqueKey(),
                    width: 55,
                    height: (widget.data.actividades[index][index2] !=
                                widget.data.actividades[index][index2 - 1] ||
                            widget.data.colores[index][index2] == Colors.white)
                        ? 55
                        : 0,
                    margin: const EdgeInsets.only(top: 3.0, bottom: 5.0),
                  );
                }
              }
            }),
          );
        })),
      ),
    );
  }

  void xd(int index, int index2) {
    final route = MaterialPageRoute(builder: (context) {
      Key key;
      return Hora(key, widget.data, index, index2);
    });
    Navigator.push(context, route).then((result) {
      setState(() {
        _color = result[0];
        ncont = result[1];
        ncont2 = result[2];
        texto = result[3];
        nhoras = result[4];
        widget.data.actividades[ncont][ncont2] = texto;
        if (nhoras == "Dos horas") {
          widget.data.actividades[ncont][ncont2 + 1] = texto;
          widget.data.colores[ncont][ncont2 + 1] = _color;
        }
      });
    });
    widget.data.colores[ncont][ncont2] = _color;
  }
}
