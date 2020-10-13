import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/hadis_data.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), (){
      Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TabsScreens(),
          ),
        );
    });

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'svg/back_img/sufara.ba_logo.png',
            ),
            Text(
              Hadis.listHadis[0].name,
            ),
          ],
        ),
      ),
    );
  }
}
