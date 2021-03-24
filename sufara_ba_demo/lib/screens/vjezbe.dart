import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_vjezbe_done.dart';
import 'package:sufara_ba_demo/widgets/harf_for_vjezbe_regural.dart';
import 'package:sufara_ba_demo/widgets/last_vjezba_done.dart';
import 'package:sufara_ba_demo/widgets/last_vjezba_regural.dart';

class Vjezbe extends StatefulWidget {
  final String dir;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  Vjezbe(this.dir, this.analytics, this.observer);

  @override
  _VjezbeState createState() => _VjezbeState();
}

class _VjezbeState extends State<Vjezbe> {
  final List<HarfModel> listHarf = DummyData.listHarfDummyData;

  SharedPrefs sharedPrefs = SharedPrefs();

  Future<void> _sendAnalyticsEvent(String event) async {
    await widget.analytics.logEvent(
      name: event,
      parameters: {},
    );
    print('logEvent succeeded');
  }

  @override
  void initState() {
    _sendAnalyticsEvent('screen_vjezbe');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_sendSetCurrentScreen('vjezba_screen');
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'svg/back_img/back_img.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.10), BlendMode.dstATop),
        ),
      ),
      height: SizeConfig.blockSizeVertical * 100,
      //ovdje ide gridview

      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 1)
              return FutureBuilder(
                future: sharedPrefs.readData('vjezba${21}'),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return LastVjezbaDone(
                      widget.dir,
                      widget.analytics,
                      widget.observer,
                    );
                  } else {
                    return LastVjezbaRegural(
                      widget.dir,
                      widget.analytics,
                      widget.observer,
                    );
                  }
                },
              );

            return GridView.builder(
              clipBehavior: Clip.none,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 3,
                horizontal: SizeConfig.blockSizeHorizontal * 4,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SizeConfig.blockSizeVertical * 2,
                mainAxisSpacing: SizeConfig.blockSizeHorizontal * 3,
              ),
              itemBuilder: (context, index) {
                int i = index - 1;
                return FutureBuilder(
                  future: sharedPrefs.readData('vjezba$i'),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return HarfWidgetForVjezbeDone(
                        listHarf[index],
                        widget.dir,
                        widget.analytics,
                        widget.observer,
                      );
                    } else {
                      return HarfWidgetForVjezbe(
                        listHarf[index],
                        widget.dir,
                        widget.analytics,
                        widget.observer,
                      );
                    }
                  },
                );
              },
              itemCount: listHarf.length,
            );
          }),
    );
  }
}
