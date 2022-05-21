import 'dart:convert';

import 'package:electricity_app/view/screens/reasult_screen.dart';
import 'package:electricity_app/view/widgets/custom_button.dart';
import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:electricity_app/view/widgets/custom_text_form_field.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:electricity_app/model/electricity_model.dart';

import '../../constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.remoteConfig});
  final RemoteConfig remoteConfig;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final List<String> _items = [];

  final List<double> _numbers = [];

  final List<int> _numberOfUnits = [];

  final List<int> _numberOfHours = [];

  int _counter = 0;

  void insert() {
    for (var i = 0;
        i <
            jsonDecode(widget.remoteConfig.getString("Data"))['products']
                .length;
        i++) {
      _items.insert(
          i,
          jsonDecode(widget.remoteConfig.getString("Data"))['products'][i]
                  ["name_ar"]
              .toString());
      _numbers.insert(
          i,
          jsonDecode(widget.remoteConfig.getString("Data"))['products'][i]["KW"]
              .toDouble());
      _numberOfUnits.insert(i, 0);
      _numberOfHours.insert(i, 0);
    }
  }

  double x = 0;
  double calculate() {
    for (var i = 0; i < _items.length; i++) {
      double y = _numberOfHours[i] * _numberOfUnits[i] * _numbers[i];
      x = y + x;
    }

    return 
    double.parse((x).toStringAsFixed(1));
  }

  @override
  void initState() {
    insert();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Electricity Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 1000,
                child: GridView.count(
                  childAspectRatio: 0.7,
                  // crossAxisCount is the number of columns
                  crossAxisCount: 2,
                  // This creates two columns with two items in each column
                  children: List.generate(_items.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: _items[index],
                                        textDirection: TextDirection.ltr,
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: 'عدد الاجهزة :',
                                      textDirection: TextDirection.rtl,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: SizedBox(
                                            height: 30,
                                            child: IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                if (_counter > 0) {
                                                  setState(() {
                                                    _counter =
                                                        _numberOfUnits[index];
                                                    _counter--;
                                                    int x = _counter;
                                                    _numberOfUnits
                                                        .removeAt(index);
                                                    _numberOfUnits.insert(
                                                        index, x);
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: CustomText(
                                            text: '${_numberOfUnits[index]}',
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: SizedBox(
                                            height: 30,
                                            child: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  if (_numberOfUnits[index] ==
                                                      null) {
                                                    _numberOfUnits[index] = 0;
                                                  }
                                                  _counter =
                                                      _numberOfUnits[index];
                                                  _counter++;
                                                  int x = _counter;
                                                  _numberOfUnits
                                                      .removeAt(index);
                                                  _numberOfUnits.insert(
                                                      index, x);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(
                                      text: 'عدد الساعات :',
                                      textDirection: TextDirection.rtl,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: SizedBox(
                                            height: 30,
                                            child: IconButton(
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {
                                                if (_counter > 0) {
                                                  setState(() {
                                                    _counter =
                                                        _numberOfHours[index];
                                                    _counter--;
                                                    int x = _counter;
                                                    _numberOfHours
                                                        .removeAt(index);
                                                    _numberOfHours.insert(
                                                        index, x);
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: CustomText(
                                            text: '${_numberOfHours[index]}',
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: SizedBox(
                                            height: 30,
                                            child: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                setState(() {
                                                  if (_numberOfHours[index] ==
                                                      null) {
                                                    _numberOfHours[index] = 0;
                                                  }
                                                  _counter =
                                                      _numberOfHours[index];
                                                  _counter++;
                                                  int x = _counter;
                                                  _numberOfHours
                                                      .removeAt(index);
                                                  _numberOfHours.insert(
                                                      index, x);
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              child: CustomButton(
                  onPressed: () {
                    calculate();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ReasultPage(x, widget.remoteConfig)));
                    // Navigator.pushAndRemoveUntil<dynamic>(
                    //   context,
                    //   MaterialPageRoute<dynamic>(
                    //     builder: (BuildContext context) => ReasultPage(x),
                    //   ),
                    //   (route) => false,
                    // );
                  },
                  text: 'النتيجة'),
            )
          ],
        ));
  }
}
