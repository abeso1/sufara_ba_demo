import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/screens/lekcije.dart';
import 'package:sufara_ba_demo/screens/vjezbe.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/custom_alert.dart';

class TabsScreens extends StatefulWidget {
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  Download download = Download();
  bool dialog = true;

  @override
  void initState() {
    //var file;
    download.checkFile().then((val) => {
          if (!val)
            {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return CustomAlert();
                  }).then((value) {
                if (value == null) {
                  setState(() {
                    dialog = false;
                  });
                }
              })
            }
            else {
              setState(() {
                    dialog = false;
                  })
            }
        });
    //print(file.toString());
    super.initState();
  }

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
          Lekcije(),
          Vjezbe(),
        ]),
      ),
    );
  }
}
