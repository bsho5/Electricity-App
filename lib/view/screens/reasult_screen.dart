import 'package:electricity_app/view/widgets/custom_button.dart';
import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

class ReasultPage extends StatelessWidget {
  const ReasultPage(this.reasult);
  final num reasult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: CustomText(
              text: 'Your Electricity Usage is : $reasult kilowatt/hour',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              text: 'Go Back')
        ],
      ),
    );
  }
}
