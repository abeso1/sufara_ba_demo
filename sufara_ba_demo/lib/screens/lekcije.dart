import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_lekcije.dart';

class Lekcije extends StatelessWidget {
  final List<HarfModel> listHarf = DUMMY_DATA.listHarfDummyData;
  final String dir;

  Lekcije(this.dir);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(25),
        itemCount: listHarf.length,
        itemBuilder: (context, index) {
          return HarfWidgetForLekcije(listHarf[index], dir);
        },
      ),
    );
  }
}
