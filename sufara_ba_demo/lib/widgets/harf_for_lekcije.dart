import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:path_provider/path_provider.dart' as path;
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/lekcija_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class HarfWidgetForLekcije extends StatefulWidget {
  final HarfModel harf;
  final String dir;

  HarfWidgetForLekcije(this.harf, this.dir);

  @override
  _HarfWidgetForLekcijeState createState() => _HarfWidgetForLekcijeState();
}

class _HarfWidgetForLekcijeState extends State<HarfWidgetForLekcije> {

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LekcijaScreen(widget.harf),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: SizeConfig.blockSizeVertical * 18,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15,
          //shadowColor: Colors.green,

          //*//*Ovako se dodaje ribon na lekcije ako treba */

          //child: Ribbon(
          //  farLength: 60,
          //  nearLength: 30,
          //  title: 'Zavrseno',
          //  titleStyle: TextStyle(
          //    color: Colors.green,
          //  ),
          //  location: RibbonLocation.topEnd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 13,
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 7,
                      top: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    child: SvgPicture.file(
                      File(
                          '${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                      //width: SizeConfig.blockSizeHorizontal * 34,
                      //height: SizeConfig.blockSizeVertical * 1,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              //SizedBox(
              //  width: SizeConfig.blockSizeHorizontal * 1,
              //),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 34,
                        height: SizeConfig.blockSizeVertical * 3,
                        margin: EdgeInsets.all(
                          SizeConfig.blockSizeVertical * 1.5,
                        ),
                        child: Text(
                          '${widget.harf.id}. lekcija',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 43,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            widget.harf.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 0.5,
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
