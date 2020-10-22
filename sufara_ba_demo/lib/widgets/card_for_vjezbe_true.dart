import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class CardForVjezbeTrue extends StatelessWidget {
  final HarfModel harf;
  final int index;

  CardForVjezbeTrue(this.harf, this.index);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: kon_boja,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.asset(
        '/data/user/0/com.example.sufara_ba_demo/app_flutter/svg/${harf.id}/${harf.images[index]['name']}.svg',
        height: SizeConfig.blockSizeVertical * 12,
        color: Colors.white,
      ),
    );
  }
}
