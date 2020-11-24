import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_vjezbe_done.dart';
import 'package:sufara_ba_demo/widgets/harf_for_vjezbe_regural.dart';
import 'package:sufara_ba_demo/widgets/last_vjezba_done.dart';
import 'package:sufara_ba_demo/widgets/last_vjezba_regural.dart';

class Vjezbe extends StatelessWidget {
  final List<HarfModel> listHarf = DummyData.listHarfDummyData;
  final String dir;
  SharedPrefs sharedPrefs = SharedPrefs();
  bool neki;

  Vjezbe(this.dir);

  @override
  Widget build(BuildContext context) {
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
                    return LastVjezbaDone(dir);
                  } else {
                    return LastVjezbaRegural(dir);
                  }
                },
              );

            return GridView.builder(
              clipBehavior: Clip.none,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                int i = index - 1;
                return FutureBuilder(
                  future: sharedPrefs.readData('vjezba$i'),
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return HarfWidgetForVjezbeDone(listHarf[index], dir);
                    } else {
                      return HarfWidgetForVjezbe(listHarf[index], dir);
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
