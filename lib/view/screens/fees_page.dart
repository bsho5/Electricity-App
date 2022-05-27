import 'dart:convert';


import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'package:flutter/material.dart';

import '../../constants.dart';

class FeesPage extends StatelessWidget {
  FeesPage({required this.remoteConfig});
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
                childAspectRatio: 0.9,
                // crossAxisCount is the number of columns
                crossAxisCount: 2,
                // This creates two columns with two items in each column
                children: List.generate(
                    jsonDecode(remoteConfig.getString("Data"))['fixedFees']
                        .length, (index) {
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
                              Text(
                                ' : KW من ${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['catgKWh_start']} - ${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['catgKWh_end']}  ',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                   
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                ' ${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['costKWh']} SDG : KW سعر ال  ',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                    
                              ),
                               const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                '  : KW السعر لل 100 ',
                                style:  TextStyle(
                                    color: Colors.white, fontSize: 17),
                                    
                              ),
                              Text(' ${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['costCatg']} SDG ' , style:  const TextStyle(
                                    color: Colors.white, fontSize: 17),),
                              const SizedBox(
                                height: 3,
                              ),
                               Text(
                                'السعر الكلي لل ${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['catgKWh_end']} KW :',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                    textDirection: TextDirection.rtl,
                              ),
                              Text('${jsonDecode(remoteConfig.getString("Data"))['fixedFees'][index]['accum']} SDG', style: const TextStyle(
                                    color: Colors.white, fontSize: 17),)
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
