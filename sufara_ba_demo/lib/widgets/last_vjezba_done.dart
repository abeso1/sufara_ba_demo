import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ribbon/ribbon.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen_za_cijelu_sufaru.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class LastVjezbaDone extends StatefulWidget {
  final HarfModel harf = DummyData.listHarfDummyData[0];
  final String dir;

  LastVjezbaDone(this.dir);

  @override
  _HarfWidgetForLekcijeState createState() => _HarfWidgetForLekcijeState();
}

class _HarfWidgetForLekcijeState extends State<LastVjezbaDone> {
  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VjezbaScreenCijelaSufara(widget.dir),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.blockSizeHorizontal * 4,
          0,
          SizeConfig.blockSizeHorizontal * 4,
          SizeConfig.blockSizeVertical * 3,
        ),
        height: SizeConfig.blockSizeVertical * 18,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.grey[200],
          elevation: 8,
          child: Ribbon(
            farLength: 60,
            nearLength: 30,
            title: 'Završeno',
            color: Colors.green[300],
            titleStyle: TextStyle(
              color: Colors.white,
            ),
            location: RibbonLocation.topEnd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: SizeConfig.blockSizeHorizontal * 20,
                      height: SizeConfig.blockSizeVertical * 13,
                      padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 5,
                        //top: SizeConfig.blockSizeHorizontal * 1,
                      ),
                      child: SvgPicture.file(
                        File(
                            '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[0]["name"]}.svg'),
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
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              '${23}. vjezba',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
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
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Cijela Sufara",
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
      ),
    );
  }
}
