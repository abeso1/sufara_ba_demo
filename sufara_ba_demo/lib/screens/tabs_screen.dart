import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/screens/lekcije.dart';
import 'package:sufara_ba_demo/screens/vjezbe.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class TabsScreens extends StatefulWidget {
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  Download download = Download();

  @override
  void initState() {
    var file = download
        .downloadFile(
          'https://firebasestorage.googleapis.com/v0/b/sufaramobile.appspot.com/o/audio.zip?alt=media&token=016531db-bde8-4bb3-82f2-7bc8ddf770a9',
          'audio.zip',
        )
        .then((value) => {
              download.unZipFile(value),
            });
    print(file.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //ovdje se treba staviti logo Sufara.ba
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
          Lekcije(),
          Vjezbe(),
        ]),
      ),
    );
  }
}
