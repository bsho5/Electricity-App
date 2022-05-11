import 'package:flutter/material.dart';


import 'view/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
       
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}





 

