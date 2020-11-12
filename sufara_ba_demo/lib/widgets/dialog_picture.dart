import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class DialogPicture extends StatelessWidget {
  final String pic;

  DialogPicture(this.pic);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      children: [
        Container(
          //height: SizeConfig.blockSizeVertical * 26,
          //width: SizeConfig.blockSizeHorizontal * 28,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeVertical * 1,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2,
                  vertical: SizeConfig.blockSizeVertical * 2,
                ),
                child: SvgPicture.file(
                  File(
                    pic,
                  ),
                  height: SizeConfig.blockSizeVertical * 30,
                  //color: Colors.green,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 35,
                height: SizeConfig.blockSizeVertical * 7,
                child: RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Zatvori prozor',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
