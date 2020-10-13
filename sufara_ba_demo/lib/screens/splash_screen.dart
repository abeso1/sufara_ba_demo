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
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TabsScreens(),
        ),
      );
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'svg/back_img/back_img_splash.jpg',
            ),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.12), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              Image.asset(
                'svg/back_img/sufara.ba_logo_splash.png',
                width: SizeConfig.blockSizeHorizontal * 50,
                height: SizeConfig.blockSizeVertical * 50,
                fit: BoxFit.fitWidth,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 15,
                ),
                child: Text(
                  Hadis.listHadis[rng.nextInt(20)].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
