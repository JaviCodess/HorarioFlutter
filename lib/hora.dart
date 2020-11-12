import 'package:calendar/main.dart';
import 'package:flutter/material.dart';
import 'package:calendar/model/cuadrado.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Hora extends StatefulWidget {
  final MisDatos md;
  final int index, index2;

  Hora(Key key, this.md, this.index, this.index2) : super(key: key);
  _Hora createState() => _Hora();

  // ValueChanged<Color> callback

}

class _Hora extends State<Hora> {
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  String dropdownValue = 'Una hora';

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void changeClass() {
    widget.md.colores[widget.index][widget.index2] = currentColor;
  }

  TextEditingController asignatura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.md.dias[widget.index] +
            ' ' +
            widget.md.horas[widget.index2 - 1]),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Expanded(
                        child: TextFormField(
                          controller: asignatura,
                          decoration: InputDecoration(
                            hintText: "",
                            labelText: "Introduce la asignatura",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: RawMaterialButton(
                          fillColor: pickerColor,
                          padding: EdgeInsets.all(20),
                          shape: CircleBorder(),
                          onPressed: () {
                            showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text("¡Elige un color!"),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                      showLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: const Text('Seleccionar'),
                                      onPressed: () {
                                        setState(
                                            () => currentColor = pickerColor);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ));
                          },
                        )),
                  ],
                ),
                Container(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Una hora', 'Dos horas']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    changeClass();

                    Navigator.of(context).pop([
                      currentColor,
                      widget.index,
                      widget.index2,
                      asignatura.text,
                      dropdownValue
                    ]);
                  },
                  child: Text('Añadir asignatura'),
                )
              ]))),
    );
  }
}
