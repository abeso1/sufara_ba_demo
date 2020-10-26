import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/hadis_data.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/custom_alert.dart';
import 'package:sufara_ba_demo/widgets/message_hadis.dart';
import 'package:sufara_ba_demo/widgets/progression_indicator.dart';
import 'package:path_provider/path_provider.dart' as path;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Download download = Download();
  bool dialog = true;
  bool done = false;
  String dir;
  String hadis;

  Future<String> getDir() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    return dir;
  }

  @override
  void initState() {
    setState(() {
      hadis = Hadis.listHadis[rng.nextInt(20)].name;
    });
    download.checkFile().then((val) => {
          if (!val)
            {
              Timer(Duration(seconds: 5), () {
                getDir().then((value) {
                  setState(() {
                    dir = value;
                  });
                });
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return CustomAlert();
                    }).then(
                  (value) {
                    if (value == false) {
                      print('ovo se desi');
                      //Navigator.of(context).pop();
                      setState(() {
                        dialog = false;
                      });
                    } else {
                      print('ovo se desi!');
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return ProgressionIndicator();
                        },
                      ).then(
                        (value) {
                          //Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return MessageHadis();
                            },
                          ).then((value) {
                            setState(() {
                              done = true;
                            });
                          });
                        },
                      );
                    }
                  },
                );
              })
            }
          else if (val)
            {
              getDir().then((value) {
                setState(() {
                  dir = value;
                });
              }),
              Timer(Duration(seconds: 5), () {
                done = true;
              }),
              setState(() {
                dialog = false;
                done = true;
              })
            }
        });
    //print(file.toString());
    super.initState();
  }

  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (done) {
      Timer(Duration(seconds: 5), () {
        Navigator.of(context).pop(
          MaterialPageRoute(
            builder: (context) => TabsScreens(dir),
          ),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TabsScreens(dir),
          ),
        );
      });
    }

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
                  hadis,
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
