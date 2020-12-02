import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribbon/ribbon.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class HarfWidgetForVjezbeDone extends StatefulWidget {
  final HarfModel harf;
  final String dir;

  HarfWidgetForVjezbeDone(this.harf, this.dir);

  @override
  _HarfWidgetForVjezbeDoneState createState() =>
      _HarfWidgetForVjezbeDoneState();
}

class _HarfWidgetForVjezbeDoneState extends State<HarfWidgetForVjezbeDone> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VjezbaScreen(widget.harf, widget.dir),
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
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Flexible(
                    //fit: BoxFit.fill,
                    child: Text(
                      '${widget.harf.id}. vježba',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  SvgPicture.file(
                    File(
                        '${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                    color: Colors.green,
                    height: SizeConfig.blockSizeVertical * 10,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
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
