import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/lekcija_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class UvodCard extends StatefulWidget {
  @override
  _HarfWidgetForLekcijeState createState() => _HarfWidgetForLekcijeState();
}

class _HarfWidgetForLekcijeState extends State<UvodCard> {
  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        //Navigator.of(context).push(
        //  MaterialPageRoute(
        //      builder: (context) => LekcijaScreen(widget.harf, widget.dir),
        //),
        //);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical * 1,
          horizontal: SizeConfig.blockSizeHorizontal * 1,
        ),
        height: SizeConfig.blockSizeVertical * 18,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(),
              Column(
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    height: SizeConfig.blockSizeVertical * 14,
                    padding: EdgeInsets.only(
                      //left: SizeConfig.blockSizeHorizontal * 1,
                      top: SizeConfig.blockSizeHorizontal * 0.5,
                    ),
                    child: SvgPicture.asset(
                      'svg/back_img/sufara.ba_logo_splash.svg',
                      //width: SizeConfig.blockSizeHorizontal * 30,
                      //height: SizeConfig.blockSizeVertical * 30,
                      //fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
              //SizedBox(
              //  width: SizeConfig.blockSizeHorizontal * 1,
              //),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 34,
                    height: SizeConfig.blockSizeVertical * 3,
                    margin: EdgeInsets.all(
                      SizeConfig.blockSizeVertical * 1.5,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Uvodna lekcija',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * 20,
                    child: FittedBox(
                      //fit: BoxFit.fill,
                      child: Text(
                        "Uvod",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
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
