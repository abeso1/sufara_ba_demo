import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribbon/ribbon.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:path_provider/path_provider.dart' as path;


class HarfWidgetForVjezbeDone extends StatefulWidget {
  final HarfModel harf;
  final String dir;

  HarfWidgetForVjezbeDone(this.harf, this.dir);

  @override
  _HarfWidgetForVjezbeDoneState createState() => _HarfWidgetForVjezbeDoneState();
}

class _HarfWidgetForVjezbeDoneState extends State<HarfWidgetForVjezbeDone> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VjezbaScreen(widget.harf),
          ),
        );
      },
      child: GridTile(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15,
          color: Colors.grey[200],
          //shadowColor: Colors.green,
          child: Ribbon(
            farLength: 60,
            nearLength: 30,
            title: 'Zavrseno',
            color: Colors.green[300],
            titleStyle: TextStyle(
              //backgroundColor: Colors.red,
              color: Colors.white,
              fontSize: 13,
            ),
            location: RibbonLocation.topEnd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    '${widget.harf.id}. vjezba',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.file(
                    File('${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                    color: Colors.green,
                    height: SizeConfig.blockSizeVertical * 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                      child: Text(
                      widget.harf.name,
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
