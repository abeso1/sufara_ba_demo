import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as path;

class CardForVjezbeTrue extends StatefulWidget {
  final HarfModel harf;
  final int index;

  CardForVjezbeTrue(this.harf, this.index);

  @override
  _CardForVjezbeTrueState createState() => _CardForVjezbeTrueState();
}

class _CardForVjezbeTrueState extends State<CardForVjezbeTrue> {
  String directory = '';

  Future<String> getDir() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    return dir;
  }

  @override
  void initState() {
    getDir().then((value) {
      setState(() {
        directory = value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      color: kon_boja,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SvgPicture.file(
        File('$directory/svg/${widget.harf.id}/${widget.harf.images[widget.index]['name']}.svg'),
        height: SizeConfig.blockSizeVertical * 12,
        color: Colors.white,
      ),
    );
  }
}
