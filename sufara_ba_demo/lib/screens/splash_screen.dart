import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/hadis_data.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class SplashScreen extends StatelessWidget {
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
              width: SizeConfig.blockSizeHorizontal * 100,
              height: SizeConfig.blockSizeVertical * 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal * 10,
              ),
              child: Text(
                Hadis.listHadis[rng.nextInt(20)].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
