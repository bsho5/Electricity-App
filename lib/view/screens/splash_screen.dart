import 'package:electricity_app/constants.dart';
import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: const Center(
          child: DefaultTextStyle(
        style: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        child: Text('ELECTRICITY APP'),
      )),
    );
  }
}
