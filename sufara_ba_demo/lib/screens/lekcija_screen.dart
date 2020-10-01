import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class LekcijaScreen extends StatefulWidget {
  final HarfModel harf;

  LekcijaScreen(this.harf);

  @override
  _LekcijaScreenState createState() => _LekcijaScreenState();
}

class _LekcijaScreenState extends State<LekcijaScreen> {
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
          '${widget.harf.id}. lekcija',
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
                //SizedBox(
                //  height: SizeConfig.blockSizeVertical * 1,
                //),

                Container(
                  padding:
                      EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
                  width: SizeConfig.blockSizeHorizontal * 100,
                  //height: SizeConfig.blockSizeVertical * 35,
                  child: Text(
                    widget.harf.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 45,
                    right: SizeConfig.blockSizeHorizontal * 3,
                  ),
                  width: SizeConfig.blockSizeHorizontal * 100,
                  child: Container(
                    //padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 50),
                    color: Colors.white12,
                    width: SizeConfig.blockSizeHorizontal * 50,
                    height: SizeConfig.blockSizeVertical * 8,
                    child: SvgPicture.asset(
                      widget.harf.imageUrl,
                      height: SizeConfig.blockSizeVertical * 6,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.blockSizeVertical * 73,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 3,
                horizontal: SizeConfig.blockSizeHorizontal * 3,
              ),
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  //ovdje naslov harfa
                  Text(
                    widget.harf.lekcijaIliVjezbaIndex,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ovjde ide opis harfa
                  Text(
                    widget.harf.opis,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  //slika grla
                  //oblici
                  //zapocni vjezbu
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
