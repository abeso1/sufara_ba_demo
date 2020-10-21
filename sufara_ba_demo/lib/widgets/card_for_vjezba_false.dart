import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CardForVjezbaFalse extends StatelessWidget {
  final HarfModel harf;

  CardForVjezbaFalse(this.harf);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SvgPicture.asset(
          '/data/user/0/com.example.sufara_ba_demo/app_flutter/svg/${harf.id}/${harf.imageUrl}.svg',
          height: SizeConfig.blockSizeVertical * 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
