import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_lekcije.dart';
import "package:sufara_ba_demo/widgets/uvod_card.dart";

class Lekcije extends StatefulWidget {
  final String dir;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  Lekcije(this.dir, this.analytics, this.observer);

  @override
  _LekcijeState createState() => _LekcijeState();
}

class _LekcijeState extends State<Lekcije> {
  final List<HarfModel> listHarf = DummyData.listHarfDummyData;

  Future<void> _sendAnalyticsEvent(String event) async {
    await widget.analytics.logEvent(
      name: event,
      parameters: {},
    );
    print('logEvent succeeded');
  }

  @override
  void initState() {
    _sendAnalyticsEvent('screen_lekcije');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_sendSetCurrentScreen('lekcije_screen');
    //this need to be added so i can use size config
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
      // ovdje ide listview
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 3,
          horizontal: SizeConfig.blockSizeHorizontal * 4,
        ),
        itemCount: listHarf.length + 1,
        itemBuilder: (context, index) {
          if (index == 0)
            return UvodCard(
              widget.analytics,
              widget.observer,
            );
          return HarfWidgetForLekcije(
            listHarf[index - 1],
            widget.dir,
            widget.analytics,
            widget.observer,
          );
        },
      ),
    );
  }
}
