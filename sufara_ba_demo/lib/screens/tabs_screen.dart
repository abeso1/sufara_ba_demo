import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/screens/lekcije.dart';
import 'package:sufara_ba_demo/screens/vjezbe.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class TabsScreens extends StatefulWidget {
  final String dir;

  TabsScreens(this.dir);

  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //ovdje se treba staviti logo Sufara.ba(psotavljen)
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'svg/back_img/sufara.ba_logo.png',
            width: SizeConfig.blockSizeHorizontal * 35,
            fit: BoxFit.cover,
          ),
          bottom: TabBar(
            labelColor: Colors.green[800],
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Lekcije',
              ),
              Tab(
                text: 'Vjezbe',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Lekcije(widget.dir),
          Vjezbe(widget.dir),
        ]),
      ),
    );
  }
}
