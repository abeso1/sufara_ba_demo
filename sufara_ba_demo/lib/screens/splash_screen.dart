import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/data/hadis_data.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
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
              Timer(
                Duration(seconds: 5),
                () {
                  getDir().then((value) {
                    setState(() {
                      dir = value;
                    });
                  });
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return ProgressionIndicator();
                    },
                  ).then(
                    (value) {
                      //Navigator.of(context).pop();
                      showDialog(
                        barrierDismissible: false,
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
                },
              ),
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
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => TabsScreens(dir),
          ),
        );
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TabsScreens(dir),
          ),
        );*/
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
                Colors.black.withOpacity(0.10), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 1,
              ),
              SvgPicture.asset(
                'svg/back_img/sufara.ba_logo_splash.svg',
                width: SizeConfig.blockSizeHorizontal * 30,
                height: SizeConfig.blockSizeVertical * 30,
                fit: BoxFit.fitWidth,
              ),
              /*Image.asset(
                'svg/back_img/sufara.png',
                width: SizeConfig.blockSizeHorizontal * 20,
                height: SizeConfig.blockSizeVertical * 20,
                fit: BoxFit.fitWidth,
              ),*/
              SizedBox(
                height: SizeConfig.blockSizeVertical * 7,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green[40],
                ),
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
