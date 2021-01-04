import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/data/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezba_false.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezbe_regural.dart';
import 'package:sufara_ba_demo/widgets/card_for_vjezbe_true.dart';
import 'package:sufara_ba_demo/widgets/custom_alert.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_vjezba.dart';

class VjezbaScreenCijelaSufara extends StatefulWidget {
  final AudioCache audioCache = AudioCache();
  final String dir;
  final AudioPlayer player = AudioPlayer();
  VjezbaScreenCijelaSufara(this.dir);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreenCijelaSufara> {
  var rng = new Random();
  int prethodni;
  int pretprethodni;
  int index1;
  int index2;
  int index3;
  int tacan;
  int tacanBroj;
  int tacnaLekcija;
  Widget jedan;
  Widget dva;
  Widget tri;
  int lekcija1 = 0;
  int lekcija2 = 0;
  int lekcija3 = 0;
  int indexColor = 0;
  List<AlwaysStoppedAnimation<MaterialColor>> _valueColors = [
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.orange),
    AlwaysStoppedAnimation(Colors.yellow),
    AlwaysStoppedAnimation(Colors.lightGreen),
    AlwaysStoppedAnimation(Colors.green),
  ];
  List<Color> _backValueColors = [
    Colors.red[100],
    Colors.red[100],
    Colors.orange[100],
    Colors.yellow[100],
    Colors.lightGreen[100],
    Colors.green[100],
  ];

  SharedPrefs prefs = SharedPrefs();
  bool playing = false;

  @override
  void dispose() {
    if (widget.player.state == AudioPlayerState.PLAYING) {
      widget.player.stop();
    }
    super.dispose();
  }

  setHarfs() {
    int lek1 = 0;
    int lek2 = 0;
    int lek3 = 0;
    ///////ovo treba popraviti kada dodu svi fajlovi
    while (lek1 == 0 || lek1 == 20) {
      lek1 = rng.nextInt(22);
    }
    while (lek2 == 0 || lek2 == 20) {
      lek2 = rng.nextInt(22);
    }
    while (lek3 == 0 || lek3 == 20) {
      lek3 = rng.nextInt(22);
    }
    setState(() {
      lekcija1 = lek1;
      lekcija2 = lek2;
      lekcija3 = lek3;
      print("lekcija1 " +
          lekcija1.toString() +
          " lekcija2 " +
          lekcija2.toString() +
          " lekcija3 " +
          lekcija3.toString());
    });
    int prvi = rng.nextInt(DummyData.listHarfDummyData[lekcija1].images.length);
    setState(() {
      index1 = prvi;
    });
    int drugi = prvi;
    bool nastavi = true;
    while (drugi == prvi || nastavi) {
      drugi = rng.nextInt(DummyData.listHarfDummyData[lekcija2].images.length);
      if (DummyData.listHarfDummyData[lekcija2].images[drugi]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['name']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija2].images[drugi]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['audio']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija2].images[drugi]['audio']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['name']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija2].images[drugi]['audio']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['audio']
                  .toLowerCase()) {
        nastavi = true;
      } else {
        nastavi = false;
      }
    }
    setState(() {
      index2 = drugi;
    });
    int treci = prvi;
    nastavi = true;
    while (treci == prvi || treci == drugi || nastavi) {
      treci = rng.nextInt(DummyData.listHarfDummyData[lekcija3].images.length);
      if (DummyData.listHarfDummyData[lekcija3].images[treci]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['name']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija3].images[treci]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['audio']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija3].images[treci]['audio']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija1].images[prvi]['name']
                  .toLowerCase()) {
        nastavi = true;
      } else if (DummyData.listHarfDummyData[lekcija3].images[treci]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija2].images[drugi]['name']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija3].images[treci]['name']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija2].images[drugi]['audio']
                  .toLowerCase() ||
          DummyData.listHarfDummyData[lekcija3].images[treci]['audio']
                  .toLowerCase() ==
              DummyData.listHarfDummyData[lekcija2].images[drugi]['name']
                  .toLowerCase()) {
        nastavi = true;
      } else {
        nastavi = false;
      }
    }
    setState(() {
      index3 = treci;
    });
    bool tacno = true;
    while (tacno) {
      List<int> array = [prvi, drugi, treci];
      int broj = rng.nextInt(array.length);
      if (array[broj] != prethodni && array[broj] != pretprethodni) {
        tacno = false;
        setState(() {
          if (broj == 0) tacnaLekcija = lekcija1;
          if (broj == 1) tacnaLekcija = lekcija2;
          if (broj == 2) tacnaLekcija = lekcija3;
          tacan = array[broj];
          tacanBroj = broj;
          pretprethodni = prethodni;
          prethodni = array[broj];
        });
      }
    }
    setState(() {
      jedan = CardForVjezbeRegural(
          DummyData.listHarfDummyData[lekcija1], index1, widget.dir);
      dva = CardForVjezbeRegural(
          DummyData.listHarfDummyData[lekcija2], index2, widget.dir);
      tri = CardForVjezbeRegural(
          DummyData.listHarfDummyData[lekcija3], index3, widget.dir);
    });
    Timer(Duration(milliseconds: 500),
        () => playAudio(DummyData.listHarfDummyData[tacnaLekcija], tacan));
  }

  answerQuestion(int i) {
    if (widget.player.state == AudioPlayerState.PLAYING) {
      widget.player.stop();
    }
    //if (widget.audioCache.)
    if (i == tacanBroj) {
      playSound('audio/CORRECT.wav');
      setState(() {
        indexColor++;
      });
      if (i == 0) {
        setState(() {
          jedan = CardForVjezbeTrue(
              DummyData.listHarfDummyData[lekcija1], index1, widget.dir);
        });
      } else if (i == 1) {
        setState(() {
          dva = CardForVjezbeTrue(
              DummyData.listHarfDummyData[lekcija2], index2, widget.dir);
        });
      } else if (i == 2) {
        setState(() {
          tri = CardForVjezbeTrue(
              DummyData.listHarfDummyData[lekcija3], index3, widget.dir);
        });
      }
      if (indexColor == 20) {
        int x = 23;
        x = x - 2;
        prefs.setData('vjezba$x');
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (ctx) {
              return CustomAlertVjezba();
            }).then(
          (value) => {
            //Navigator.of(context).pop(),
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (context) => TabsScreens(
                  widget.dir,
                ),
              ),
            ),
          },
        );
      } else {
        Timer(Duration(seconds: 1), () {
          setHarfs();
          Timer(Duration(seconds: 1), () {
            setState(() {
              playing = false;
            });
          });
        });
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
          jedan = CardForVjezbaFalse(
              DummyData.listHarfDummyData[lekcija1], index1, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            jedan = CardForVjezbeRegural(
                DummyData.listHarfDummyData[lekcija1], index1, widget.dir);
          });
        });
      } else if (i == 1) {
        setState(() {
          dva = CardForVjezbaFalse(
              DummyData.listHarfDummyData[lekcija2], index2, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            dva = CardForVjezbeRegural(
                DummyData.listHarfDummyData[lekcija2], index2, widget.dir);
          });
        });
      } else if (i == 2) {
        setState(() {
          tri = CardForVjezbaFalse(
              DummyData.listHarfDummyData[lekcija3], index3, widget.dir);
        });
        Timer(Duration(seconds: 1), () {
          setState(() {
            tri = CardForVjezbeRegural(
                DummyData.listHarfDummyData[lekcija3], index3, widget.dir);
          });
        });
      }
      Timer(Duration(milliseconds: 1100), () {
        playAudio(DummyData.listHarfDummyData[tacnaLekcija], tacan);
        Timer(Duration(seconds: 1), () {
          setState(() {
            playing = false;
          });
        });
      });
    }
  }

  //this functions plays audio in 172 line
  playAudio(HarfModel harf, int index) async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    if (widget.player.state == AudioPlayerState.PLAYING) {
      widget.player.stop();
    }
    if (harf.images[index]['audio'].isEmpty) {
      await widget.player.play(
          '$dir/audio/${harf.id}/${harf.images[index]['name']}.mp3',
          isLocal: true);
      setState(() {});
    } else {
      await widget.player.play(
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
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            '${23}. vježba',
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
                colors: [kon_boja, poc_boja],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 13,
              width: SizeConfig.blockSizeHorizontal * 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  //ovaj gradient je popravljen
                  colors: [kon_boja, poc_boja],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 6),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Text(
                      'Vježba',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 5,
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
                      "Cijela Sufara",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 4.4,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //klikom poslusajte
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1,
                horizontal: SizeConfig.blockSizeHorizontal * 3,
              ),
              child: SizedBox(
                width: SizeConfig.blockSizeVertical * 90,
                height: SizeConfig.blockSizeVertical * 12,
                child: Container(
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 5,
                      color: Colors.blue,
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 6,
                      ),
                      Icon(
                        Icons.report_outlined,
                        size: SizeConfig.blockSizeHorizontal * 10,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 1,
                      ),
                      Flexible(
                        child: Text(
                          'Poslušajte izgovor i odaberite tačan odgovor.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //ovdje idu 3 kartice i button za izgovor
            //ovdje koristim listview samo jer znam da idu 3 slikice one i button
            //mozda ako bude trebalo napravim odvojen ovaj widget
            Container(
              padding: EdgeInsets.symmetric(
                //vertical: SizeConfig.blockSizeVertical * 1,
                horizontal: SizeConfig.safeBlockHorizontal * 15,
              ),
              height: SizeConfig.blockSizeVertical * 56,
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!playing) {
                        setState(() {
                          playing = true;
                        });
                        answerQuestion(0);
                      }
                    },
                    child: jedan,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!playing) {
                        setState(() {
                          playing = true;
                        });
                        answerQuestion(1);
                      }
                    },
                    child: dva,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!playing) {
                        setState(() {
                          playing = true;
                        });
                        answerQuestion(2);
                      }
                    },
                    child: tri,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 2,
                      vertical: SizeConfig.blockSizeVertical * 1,
                    ),
                    width: SizeConfig.safeBlockHorizontal * 95,
                    height: SizeConfig.blockSizeVertical * 4,
                    child: LiquidLinearProgressIndicator(
                      //minHeight: SizeConfig.blockSizeVertical * 2,
                      backgroundColor:
                          _backValueColors[(indexColor / 4).floor()],
                      value: indexColor / 20,
                      valueColor: _valueColors[(indexColor / 4).floor()],
                      direction: Axis.horizontal,
                      borderRadius: 10,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 6,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeVertical * 7,
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        playAudio(
                            DummyData.listHarfDummyData[tacnaLekcija], tacan);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(0),
                      elevation: 5,
                      child: Container(
                        //padding: EdgeInsets.symmetric(
                        //  horizontal: SizeConfig.blockSizeVertical * 7,
                        //  vertical: SizeConfig.blockSizeVertical * 1.25,
                        //),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [kon_boja, poc_boja],
                          ),
                          //boxShadow: [
                          //BoxShadow(
                          //color: Colors.lightGreen[100],
                          //blurRadius: 2.0,
                          //spreadRadius: 0.0,
                          //offset: Offset(
                          //    2.0, 2.0), // shadow direction: bottom right
                          //)
                          //],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.replay,
                              color: Colors.white,
                              size: SizeConfig.blockSizeVertical * 4.5,
                            ),
                            Center(
                              child: FittedBox(
                                fit: BoxFit.fill,
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
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 1,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () => showDialog<bool>(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return CustomAlert();
        },
      ).then(
        (value) {
          if (value == true) {
            return true;
          }
          return false;
        },
      ),
    );
  }
}
