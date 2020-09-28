import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/lekcija_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class HarfWidgetForLekcije extends StatelessWidget {
  final HarfModel harf;

  HarfWidgetForLekcije(this.harf);

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LekcijaScreen(harf),
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
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 7,
                      top: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    child: SvgPicture.asset(
                      harf.imageUrl,
                      width: SizeConfig.blockSizeHorizontal * 34,
                      height: SizeConfig.blockSizeVertical * 12,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.blockSizeHorizontal * 34,
                        height: SizeConfig.blockSizeVertical * 3,
                        margin:
                            EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                        child: Text(
                          '${harf.id}. lekcija',
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
                      Text(
                        harf.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
