import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/widgets/harf_for_lekcije.dart';
import "package:sufara_ba_demo/widgets/uvod_card.dart";

class Lekcije extends StatelessWidget {
  final List<HarfModel> listHarf = DummyData.listHarfDummyData;
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
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 3,
          horizontal: SizeConfig.blockSizeHorizontal * 4,
        ),
        itemCount: listHarf.length + 1,
        itemBuilder: (context, index) {
          if(index==0) return UvodCard();
          return HarfWidgetForLekcije(listHarf[index-1], dir);
        },
      ),
    );
  }
}
