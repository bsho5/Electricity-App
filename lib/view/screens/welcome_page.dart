import 'package:electricity_app/constants.dart';
import 'package:electricity_app/service/remote_config_service.dart';
import 'package:electricity_app/view/screens/fees_page.dart';
import 'package:electricity_app/view/widgets/custom_button.dart';
import 'package:electricity_app/view/widgets/custom_text.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'devices_usage_page.dart';
import 'my_home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<RemoteConfig>(
          future: setupRemoteConfig(),
          builder:
              (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'Chose The service that you want :',
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NewWidget(
                        text: 'Calculate',
                        page: snapshot.hasData
                            ? MyHomePage(remoteConfig: snapshot.requireData)
                            : Container(),
                        snapshot: snapshot,
                      ),
                      NewWidget(
                        text: 'Fees',
                        page: snapshot.hasData
                            ? FeesPage(remoteConfig: snapshot.requireData)
                            : Container(),
                        snapshot: snapshot,
                      ),
                      NewWidget(
                        text: 'Devices Usage',
                        page: snapshot.hasData
                            ? DevicesUsagePage(remoteConfig: snapshot.requireData)
                            : Container(),
                        snapshot: snapshot,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.snapshot,
    required this.page, required this.text,
  }) : super(key: key);
  final AsyncSnapshot<RemoteConfig> snapshot;
  final Widget page;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => snapshot.hasData
                      ? page
                      : Container(
                          color: Colors.white,
                          child: const Center(
                              child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ))))));
        },
        text: text);
  }
}
