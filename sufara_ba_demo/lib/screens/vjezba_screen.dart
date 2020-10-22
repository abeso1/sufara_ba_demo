import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezba_false.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezbe_regural.dart';

class VjezbaScreen extends StatefulWidget {
  final HarfModel harf;

  VjezbaScreen(this.harf);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreen> {
  var rng = new Random();
  int index1;
  int index2;
  int index3;
  int tacan;
  Widget jedan;
  Widget dva;
  Widget tri;

  //this functions plays audio in 172 line
  playAudio(HarfModel harf, int index) async {
    AudioPlayer player = AudioPlayer();
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    if (harf.images[index]['audio'].isEmpty) {
      await player.play(
          '$dir/audio/${harf.id}/${harf.images[index]['name']}.mp3',
          isLocal: true);
      setState(() {});
    } else {
      await player.play(
          '$dir/audio/${harf.id}/${harf.images[index]['audio']}.mp3',
          isLocal: true);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    int prvi = rng.nextInt(widget.harf.images.length);
    setState(() {
      index1 = prvi;
    });
    int drugi = prvi;
    while(drugi == prvi){
      drugi = rng.nextInt(widget.harf.images.length);
    }
    setState(() {
      index2 = drugi;
    });
    int treci = prvi;
    while(treci == prvi || treci == drugi){
      treci = rng.nextInt(widget.harf.images.length);
    }
    setState(() {
      index3 = treci;
    });
    List<int> array = [prvi,drugi, treci]; 
    int broj = rng.nextInt(array.length);
    setState(() {
      tacan = array[broj];
    });
    setState(() {
      jedan = CardForVjezbeRegural(widget.harf, index1);
      dva = CardForVjezbeRegural(widget.harf, index2);
      tri = CardForVjezbeRegural(widget.harf, index3);
    });
    super.initState();
  }

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
              fontFamily: 'Roboto',
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                //ovaj gradient je popravljen
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
                  //ovaj gradient je popravljen
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
                        fontFamily: 'Roboto',
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
                        fontFamily: 'Roboto',
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
                  jedan,
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  dva,
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  tri,
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 6,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeVertical * 7,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        playAudio(widget.harf, tacan);
                      },
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
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 20,
                          ),
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
