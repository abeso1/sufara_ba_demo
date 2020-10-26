import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class CardForVjezbeTrue extends StatefulWidget {
  final HarfModel harf;
  final int index;
  final String dir;

  CardForVjezbeTrue(this.harf, this.index, this.dir);

  @override
  _CardForVjezbeTrueState createState() => _CardForVjezbeTrueState();
}

class _CardForVjezbeTrueState extends State<CardForVjezbeTrue> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: kon_boja,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.file(
        File('${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[widget.index]['name']}.svg'),
        height: SizeConfig.blockSizeVertical * 12,
        color: Colors.white,
      ),
    );
  }
}
