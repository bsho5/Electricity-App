import 'package:electricity_app/view/widgets/custom_button.dart';
import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'my_home_page.dart';

class ReasultPage extends StatelessWidget {
  const ReasultPage(this.reasult, this.remoteConfig);
   final double reasult;
   final RemoteConfig remoteConfig;

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
              text: 'استهلاكك للكهرباء هو : $reasult كيلو/الساعة',
              textDirection: TextDirection.rtl,
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
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyHomePage(remoteConfig: remoteConfig,)));
                
              },
              text: 'ارجع للخلف')
        ],
      ),
    );
  }
}
