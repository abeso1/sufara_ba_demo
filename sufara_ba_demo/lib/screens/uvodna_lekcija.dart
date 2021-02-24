import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/models/opis_uvod.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class UvodnaLekcija extends StatefulWidget {
  OpisUvod opisUvod = OpisUvod();
  @override
  _LekcijaScreenState createState() => _LekcijaScreenState();
}

class _LekcijaScreenState extends State<UvodnaLekcija> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.screenWidth);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Uvodna lekcija',
            //textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kon_boja, poc_boja],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              0,
              SizeConfig.blockSizeVertical * 2,
              0,
              0,
            ),
            height: SizeConfig.screenWidth > 850 ?SizeConfig.blockSizeVertical * 15 :  SizeConfig.blockSizeVertical * 10,
            width: SizeConfig.blockSizeHorizontal * 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [kon_boja, poc_boja],
                )),
            child: Column(
              children: [
                //SizedBox(
                //  height: SizeConfig.blockSizeVertical * 1,
                //),

                Container(
                  padding:
                      EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
                  width: SizeConfig.blockSizeHorizontal * 100,
                  //height: SizeConfig.blockSizeVertical * 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Uvod",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6.8,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height:SizeConfig.screenWidth > 850 ?SizeConfig.blockSizeVertical * 72 :  SizeConfig.blockSizeVertical * 77,
              padding: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal * 3,
                SizeConfig.blockSizeVertical * 2,
                SizeConfig.blockSizeHorizontal * 3,
                0,
              ),
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [widget.opisUvod.getOpisUvod(0)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
