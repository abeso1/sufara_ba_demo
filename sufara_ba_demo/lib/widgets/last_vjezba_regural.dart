import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen_za_cijelu_sufaru.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_vjezba_locked.dart';
import 'package:sufara_ba_demo/widgets/lockedVjezba.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class LastVjezbaRegural extends StatefulWidget {
  final HarfModel harf = DummyData.listHarfDummyData[0];
  final String dir;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  LastVjezbaRegural(this.dir, this.analytics, this.observer);

  @override
  _HarfWidgetForLekcijeState createState() => _HarfWidgetForLekcijeState();
}

class _HarfWidgetForLekcijeState extends State<LastVjezbaRegural> {
  SharedPrefs sharedPrefs = SharedPrefs();

  Future<void> _sendAnalyticsEvent(String event) async {
    await widget.analytics.logEvent(
      name: event,
      parameters: {},
    );
    print('logEvent succeeded');
  }

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return FutureBuilder(
        future: sharedPrefs.readData("vjezba" + (23 - 3).toString()),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return GestureDetector(
              onTap: () {
                _sendAnalyticsEvent("entering_last_vjezba_cijela_sufara");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VjezbaScreenCijelaSufara(
                      widget.dir,
                      analytics: widget.analytics,
                      observer: widget.observer,
                    ),
                    settings: RouteSettings(name: 'VjezbaCijelaSufaraRegular'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal * 4,
                  0,
                  SizeConfig.blockSizeHorizontal * 4,
                  SizeConfig.blockSizeVertical * 3,
                ),
                height: SizeConfig.blockSizeVertical * 18,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: SizeConfig.blockSizeHorizontal * 20,
                            height: SizeConfig.blockSizeVertical * 13,
                            padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 5,
                              //top: SizeConfig.blockSizeHorizontal * 1,
                            ),
                            child: SvgPicture.file(
                              File(
                                  '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[0]["name"]}.svg'),
                              //width: SizeConfig.blockSizeHorizontal * 34,
                              //height: SizeConfig.blockSizeVertical * 1,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      //SizedBox(
                      //  width: SizeConfig.blockSizeHorizontal * 1,
                      //),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 34,
                                height: SizeConfig.blockSizeVertical * 3,
                                margin: EdgeInsets.all(
                                  SizeConfig.blockSizeVertical * 1.5,
                                ),
                                child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    '${23}. vjezba',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 43,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Cijela Sufara",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 0.5,
                      ),
                    ],
                  ),
                ),
              ),
              //),
            );
          } else {
            return GestureDetector(
              onTap: () {
                _sendAnalyticsEvent("cant_enter_last_vjezba_cijela_sufara");
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return CustomAlertVjezbaLocked();
                    });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockSizeHorizontal * 4,
                  0,
                  SizeConfig.blockSizeHorizontal * 4,
                  SizeConfig.blockSizeVertical * 3,
                ),
                height: SizeConfig.blockSizeVertical * 18,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 8,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: SizeConfig.blockSizeHorizontal * 20,
                                height: SizeConfig.blockSizeVertical * 13,
                                padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 5,
                                  //top: SizeConfig.blockSizeHorizontal * 1,
                                ),
                                child: SvgPicture.file(
                                  File(
                                      '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[0]["name"]}.svg'),
                                  //width: SizeConfig.blockSizeHorizontal * 34,
                                  //height: SizeConfig.blockSizeVertical * 1,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                          //SizedBox(
                          //  width: SizeConfig.blockSizeHorizontal * 1,
                          //),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 34,
                                    height: SizeConfig.blockSizeVertical * 3,
                                    margin: EdgeInsets.all(
                                      SizeConfig.blockSizeVertical * 1.5,
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Text(
                                        '${23}. vjezba',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal * 43,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Cijela Sufara",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: name_color,
                                          fontSize: 26,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 0.5,
                          ),
                        ],
                      ),
                      lockedVjezba(context),
                    ],
                  ),
                ),
              ),

              //),
            );
          }
        });
  }
}
