import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:flutter/cupertino.dart';

class ProgressionIndicator extends StatefulWidget {
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  double progress = 0;
  String text = 'Preuzimanje podataka...';
  Download download = Download();
  bool isInit = true;
  List<AlwaysStoppedAnimation<MaterialColor>> _valueColors = [
    AlwaysStoppedAnimation(Colors.red),
    //AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.orange),
    AlwaysStoppedAnimation(Colors.yellow),
    AlwaysStoppedAnimation(Colors.lightGreen),
    AlwaysStoppedAnimation(Colors.green),
  ];
  List<Color> _backValueColors = [
    Colors.red[100],
    //Colors.red[100],
    Colors.orange[100],
    Colors.yellow[100],
    Colors.lightGreen[100],
    Colors.green[100],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // progress = Provider.of<Download>(context, listen: false).progress;
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {},
      child: SimpleDialog(
        title: FittedBox(
          child: Text(
            "Preuzimanje potrebnih podataka",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              fontFamily: "Roboto",
            ),
          ),
        ),
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              if (progress < 100) {
                progress = download.downloadProgress;
                print(progress);
                if (progress > 0.9955) {
                  Timer(Duration(milliseconds: 200), () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setBool('preuzetoje2', true);
                    Navigator.of(context).pop();
                  });
                }
              }

              /*if (isInit) {
                download
                    .downloadAndUnzipAudio(setState)
                    .then((value) => download.downloadAndUnzipSvg(setState))
                    .then((val) {
                  isInit = false;
                });
              }*/

              if (isInit) {
                download.downloadAndUnzipAudio(setState).then((value) {
                  isInit = false;
                });
              }

              return Container(
                //height: 150,
                //width: 150,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Stack(
                  //fit: StackFit.expand,
                  children: [
                    Center(
                      child: SizedBox(
                        height: SizeConfig.blockSizeVertical * 2.8,
                        width: SizeConfig.blockSizeHorizontal * 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: _backValueColors[
                                ((progress * 100) / 20).floor()],
                            valueColor:
                                _valueColors[((progress * 100) / 20).floor()],
                            //minHeight: 10,
                            //borderRadius: 15,
                            //direction: Axis.horizontal,
                            value: progress,
                            //backgroundColor: Colors.green[100],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            //height: SizeConfig.blockSizeVertical * 9,
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 9,
              vertical: SizeConfig.blockSizeVertical * 1,
            ),
            child: FittedBox(
              child: Text(
                "Saburom je džennet prekriven! \nStrpi se, Allah je na strani strpljivih..",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
