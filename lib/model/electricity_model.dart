import 'package:flutter/material.dart';

class ElectricityModel {
  String? hours, units, unitName;
  ElectricityModel({this.hours, this.unitName, this.units});
  ElectricityModel.fromJason(Map<dynamic,dynamic>map){
     if (map == null) {
      return;
    }
    hours = map['hours'];
    units = map['units'];
    unitName = map['unitName'];
  }
  toJason() {
    return {
      'hours' : hours,
      'units' : units,
      'unitName': unitName,
    };
  }
}
