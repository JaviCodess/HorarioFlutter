import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MisDatos {
  int id;

  var horas = ['8:00', '8:55', '9:50', '10:45', '12:05', '13:00', '13:55'];
  var dias = ['X', 'LUN', 'MAR', 'MIE', 'JUE', 'VIE'];

  var actividades = List<List<String>>(6);
  var colores = List<List<Color>>(6);
  MisDatos();
}
