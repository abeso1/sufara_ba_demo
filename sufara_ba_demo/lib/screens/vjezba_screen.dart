import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezba_false.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezbe_regural.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezbe_true.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_vjezba.dart';

class VjezbaScreen extends StatefulWidget {
  final HarfModel harf;
  final AudioCache audioCache = AudioCache();
  final String dir;

  VjezbaScreen(this.harf, this.dir);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreen> {
  var rng = new Random();
  int index1;
  int index2;
  int index3;
  int tacan;
  int tacanBroj;
  Widget jedan;
  Widget dva;
  Widget tri;
  Color _color = Colors.grey;
  int indexColor = 0;
  List<AlwaysStoppedAnimation<MaterialColor>> _valueColors = [
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.orange),
    AlwaysStoppedAnimation(Colors.yellow),
    AlwaysStoppedAnimation(Colors.lightGreen),
    AlwaysStoppedAnimation(Colors.green),
  ];
  SharedPrefs prefs = SharedPrefs();

  setHarfs() {
    int prvi = rng.nextInt(widget.harf.images.length);
    setState(() {
      index1 = prvi;
    });
    int drugi = prvi;
    while (drugi == prvi) {
      drugi = rng.nextInt(widget.harf.images.length);
    }
    setState(() {
      index2 = drugi;
    });
    int treci = prvi;
    while (treci == prvi || treci == drugi) {
      treci = rng.nextInt(widget.harf.images.length);
    }
    setState(() {
      index3 = treci;
    });
    List<int> array = [prvi, drugi, treci];
    int broj = rng.nextInt(array.length);
    setState(() {
      tacan = array[broj];
      tacanBroj = broj;
    });
    setState(() {
      jedan = CardForVjezbeRegural(widget.harf, index1, widget.dir);
      dva = CardForVjezbeRegural(widget.harf, index2, widget.dir);
      tri = CardForVjezbeRegural(widget.harf, index3, widget.dir);
    });
    Timer(Duration(milliseconds: 500), () => playAudio(widget.harf, tacan));
  }

  answerQuestion(int i) {
    if (i == tacanBroj) {
      playSound('audio/CORRECT.wav');
      setState(() {
        indexColor++;
      });
      if (i == 0) {
        setState(() {
          jedan = CardForVjezbeTrue(widget.harf, index1, widget.dir);
        });
      } else if (i == 1) {
        setState(() {
          dva = CardForVjezbeTrue(widget.harf, index2, widget.dir);
        });
      } else if (i == 2) {
        setState(() {
          tri = CardForVjezbeTrue(widget.harf, index3, widget.dir);
        });
      }
      if (indexColor == 5) {
        int x = int.parse(widget.harf.id);
        x = x - 2;
        prefs.setData('vjezba$x');
        showDialog(
            context: context,
            builder: (ctx) {
              return CustomAlertVjezba();
            }).then(
          (value) => {
            Navigator.of(context).pop(),
            Navigator.of(context).pop(),
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TabsScreens(widget.dir,),
              ),
            ),
          },
        );
      } else {
        Timer(Duration(seconds: 1), () => setHarfs());
      }
    } else {
      playSound('audio/NOT CORRECT.wav');
      if (indexColor > 0) {
        setState(() {
          indexColor--;
        });
      }
      if (i == 0) {
        setState(() {
          jedan = CardForVjezbaFalse(widget.harf, index1, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            jedan = CardForVjezbeRegural(widget.harf, index1, widget.dir);
          });
        });
      } else if (i == 1) {
        setState(() {
          dva = CardForVjezbaFalse(widget.harf, index2, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            dva = CardForVjezbeRegural(widget.harf, index2, widget.dir);
          });
        });
      } else if (i == 2) {
        setState(() {
          tri = CardForVjezbaFalse(widget.harf, index3, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            tri = CardForVjezbeRegural(widget.harf, index3, widget.dir);
          });
        });
      }
      Timer(Duration(milliseconds: 1100), () {
        playAudio(widget.harf, tacan);
      });
    }
  }

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

  playSound(String music) async {
    await widget.audioCache.play(music);
  }

  @override
  void initState() {
    setHarfs();
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
                  GestureDetector(
                    onTap: () {
                      answerQuestion(0);
                    },
                    child: jedan,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      answerQuestion(1);
                    },
                    child: dva,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      answerQuestion(2);
                    },
                    child: tri,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 2,
                      vertical: SizeConfig.blockSizeVertical * 2,
                    ),
                    width: SizeConfig.safeBlockHorizontal * 95,
                    child: LinearProgressIndicator(
                      minHeight: SizeConfig.blockSizeVertical * 2,
                      backgroundColor: _color,
                      value: indexColor / 5,
                      valueColor: _valueColors[indexColor],
                    ),
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
                        //padding: EdgeInsets.symmetric(
                        //  horizontal: SizeConfig.blockSizeVertical * 7,
                        //  vertical: SizeConfig.blockSizeVertical * 1.25,
                        //),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [kon_boja, poc_boja],
                          ),
                        ),
                        child: Center(
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
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
