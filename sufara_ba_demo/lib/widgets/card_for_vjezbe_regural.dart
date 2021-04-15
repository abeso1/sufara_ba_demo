import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CardForVjezbeRegural extends StatefulWidget {
  final HarfModel harf;
  final int index;
  final String dir;

  CardForVjezbeRegural(this.harf, this.index, this.dir);

  @override
  _CardForVjezbeReguralState createState() => _CardForVjezbeReguralState();
}

class _CardForVjezbeReguralState extends State<CardForVjezbeRegural> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.asset(
        'assets/svg/${widget.harf.id}/${widget.harf.images[widget.index]['name']}.svg',
        height: SizeConfig.blockSizeVertical * 12,
        color: Colors.green,
      ),
    );
  }
}
