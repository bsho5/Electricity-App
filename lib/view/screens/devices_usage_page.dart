import 'dart:convert';

import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';

class DevicesUsagePage extends StatelessWidget {
  DevicesUsagePage({required this.remoteConfig});
  final RemoteConfig remoteConfig;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
              children: [
          Expanded(
            child: SizedBox(
              height: 1000,
              child: GridView.count(
                childAspectRatio: 1.2,
                // crossAxisCount is the number of columns
                crossAxisCount: 2,
                // This creates two columns with two items in each column
                children: List.generate(
                    jsonDecode(remoteConfig.getString("Data"))['products'].length,
                    (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(' :اسم الجهاز ',style: TextStyle(color: Colors.white,fontSize: 20),),
                               SizedBox(height: 3,),
                              Text( '${jsonDecode(remoteConfig.getString("Data"))['products'][index]['name_ar']}',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                            
                              SizedBox(height: 5,),
                               Text(' :استخدام الجهاز ',style: TextStyle(color: Colors.white,fontSize: 20),),
                               SizedBox(height: 3,),
                              Text( '${jsonDecode(remoteConfig.getString("Data"))['products'][index]['KW']}KW/H',style: TextStyle(color: Colors.white,fontSize: 15),textDirection: TextDirection.rtl,),
                            ],
                          ),
                        )),
                  );
                }),
              ),
            ),
          ),
              ],
            ),
        ));
  }
}
