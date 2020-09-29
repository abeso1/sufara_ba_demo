import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class VjezbaScreen extends StatefulWidget {
  final HarfModel harf;

  VjezbaScreen(this.harf);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            '${widget.harf.id}. vjezba',
            //textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //ovaj gradient treba popraviti
                colors: [poc_boja, kon_boja],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 15,
              width: SizeConfig.blockSizeHorizontal * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  //ovaj gradient treba popraviti
                  colors: [poc_boja, kon_boja],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Text(
                      'Vjezba',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Text(
                      widget.harf.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //ovdje idu 3 kartice i button za izgovor
            //ovdje koristim listview samo jer znam da idu 3 slikice one i button
            //mozda ako bude trebalo napravim odvojen ovaj widget
            Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 5,
                horizontal: SizeConfig.safeBlockHorizontal * 15,
              ),
              height: SizeConfig.blockSizeVertical * 73,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SvgPicture.asset(
                        widget.harf.imageUrl,
                        height: SizeConfig.blockSizeVertical * 12,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      widget.harf.imageUrl,
                      height: SizeConfig.blockSizeVertical * 12,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      widget.harf.imageUrl,
                      height: SizeConfig.blockSizeVertical * 12,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 6,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeVertical * 7,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeVertical * 7,
                        vertical: SizeConfig.blockSizeVertical * 1.25,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [kon_boja, poc_boja],
                        ),
                      ),
                      child: Text(
                        'IZGOVOR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
