import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_vjezba_locked.dart';
import 'package:sufara_ba_demo/widgets/lockedVjezba.dart';

class HarfWidgetForVjezbe extends StatefulWidget {
  final HarfModel harf;
  final String dir;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  HarfWidgetForVjezbe(this.harf, this.dir, this.analytics, this.observer);

  @override
  _HarfWidgetForVjezbeState createState() => _HarfWidgetForVjezbeState();
}

class _HarfWidgetForVjezbeState extends State<HarfWidgetForVjezbe> {
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
    int vjezbaId = int.parse(widget.harf.id);
    SizeConfig().init(context);

    return FutureBuilder(
      future: sharedPrefs.readData("vjezba" + (vjezbaId - 3).toString()),
      builder: (context, snapshot) {
        if (snapshot.data == true || vjezbaId == 1) {
          return GestureDetector(
            onTap: () {
              _sendAnalyticsEvent('entering_vjezba_${widget.harf.id}');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VjezbaScreen(widget.harf, widget.dir,
                      widget.analytics, widget.observer),
                  settings: RouteSettings(name: 'VjezbaScreen'),
                ),
              );
            },
            child: GridTile(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                //color: Colors.grey[200],
                //shadowColor: Colors.green,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1,
                        horizontal: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 3,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                '${widget.harf.id}. vježba',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(
                          //  height: SizeConfig.blockSizeVertical * 2,
                          //),
                          Expanded(
                            //fit: BoxFit.fill,
                            child: SvgPicture.file(
                              File(
                                  '${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                              color: Colors.green,
                              width: SizeConfig.blockSizeHorizontal * 20,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              widget.harf.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeVertical * 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              _sendAnalyticsEvent('cant_enter_vjezba_${widget.harf.id}');
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) {
                    return CustomAlertVjezbaLocked();
                  });
            },
            child: GridTile(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 8,
                //color: Colors.grey[200],
                //shadowColor: Colors.green,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1,
                        horizontal: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 3,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                '${widget.harf.id}. vježba',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(
                          //  height: SizeConfig.blockSizeVertical * 2,
                          //),
                          Expanded(
                            //fit: BoxFit.fill,
                            child: SvgPicture.file(
                              File(
                                  '${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                              color: Colors.grey,
                              width: SizeConfig.blockSizeHorizontal * 20,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 1,
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              widget.harf.name,
                              style: TextStyle(
                                color: name_color,
                                fontSize: SizeConfig.blockSizeVertical * 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    lockedVjezba(context),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
