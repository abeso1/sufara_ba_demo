import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
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
import 'package:sufara_ba_demo/widgets/vjezbaInit.dart';

class VjezbaScreen extends StatefulWidget {
  final HarfModel harf;
  final AudioCache audioCache = AudioCache();
  final String dir;
  final AudioPlayer player = AudioPlayer();

  VjezbaScreen(this.harf, this.dir);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreen> {
  var rng = new Random();
  int prethodni;
  int pretprethodni;
  int index1;
  int index2;
  int index3;
  int tacan;
  int tacanBroj;
  Widget jedan;
  Widget dva;
  Widget tri;
  int indexColor = 0;
  List<AlwaysStoppedAnimation<MaterialColor>> _valueColors = [
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.red),
    AlwaysStoppedAnimation(Colors.orange),
    AlwaysStoppedAnimation(Colors.amber),
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

  setHarfs({bool init = false}) {
    int prvi = rng.nextInt(widget.harf.images.length);
    setState(() {
      index1 = prvi;
    });
    int drugi = prvi;
    bool nastavi = true;
    while (drugi == prvi || nastavi) {
      drugi = rng.nextInt(widget.harf.images.length);
      print("ovdje sam 1");
      if (widget.harf.images[drugi]['name'].toLowerCase() ==
              widget.harf.images[prvi]['name'].toLowerCase() ||
          widget.harf.images[drugi]['name'].toLowerCase() ==
              widget.harf.images[prvi]['audio'].toLowerCase() ||
          widget.harf.images[drugi]['audio'].toLowerCase() ==
              widget.harf.images[prvi]['name'].toLowerCase() ||
          widget.harf.images[drugi]['audio'].toLowerCase() ==
                  widget.harf.images[prvi]['audio'].toLowerCase() &&
              widget.harf.id != "21" &&
              widget.harf.images[drugi]['audio'].length != 0) {
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
      treci = rng.nextInt(widget.harf.images.length);
      print("ovdje sam 2");
      if (widget.harf.images[treci]['name'].toLowerCase() ==
              widget.harf.images[prvi]['name'].toLowerCase() ||
          widget.harf.images[treci]['name'].toLowerCase() ==
              widget.harf.images[prvi]['audio'].toLowerCase() ||
          widget.harf.images[treci]['audio'].toLowerCase() ==
              widget.harf.images[prvi]['name'].toLowerCase()) {
        nastavi = true;
      } else if (widget.harf.images[treci]['name'].toLowerCase() ==
              widget.harf.images[drugi]['name'].toLowerCase() ||
          widget.harf.images[treci]['name'].toLowerCase() ==
              widget.harf.images[drugi]['audio'].toLowerCase() ||
          widget.harf.images[treci]['audio'].toLowerCase() ==
              widget.harf.images[drugi]['name'].toLowerCase()) {
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
          tacan = array[broj];
          tacanBroj = broj;
          pretprethodni = prethodni;
          prethodni = array[broj];
        });
      }
    }
    setState(() {
      jedan = CardForVjezbeRegural(widget.harf, index1, widget.dir);
      dva = CardForVjezbeRegural(widget.harf, index2, widget.dir);
      tri = CardForVjezbeRegural(widget.harf, index3, widget.dir);
    });
    Timer(Duration(milliseconds: 500), () {
      if (widget.harf.id != "21" && !init) {
        playAudio(widget.harf, tacan);
      }
    });
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
      if (indexColor == 10) {
        int x = int.parse(widget.harf.id);
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
    widget.harf.id != "21" ? setHarfs(init: true) : setHarfs();
    if (widget.harf.id != "21") {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) {
            return VjezbaInit(widget.harf.id);
          },
        ).then((value) => playAudio(widget.harf, tacan));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Future.delayed(Duration.zero, () {});

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0,
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${widget.harf.id}. vježba',
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
                    height: SizeConfig.blockSizeVertical * 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Vježba',
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
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 5,
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 6,
                      //right: SizeConfig.blockSizeHorizontal * 5,
                    ),
                    width: SizeConfig.blockSizeHorizontal * 100,
                    //child: Flexible(
                    //fit: BoxFit.fitHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.fill,
                                child: AutoSizeText(
                                  widget.harf.name,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: SizeConfig.blockSizeVertical * 4,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                  ),
                                  //),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                        child: AutoSizeText(
                          widget.harf.id != "21"
                              ? 'Poslušajte izgovor i odaberite tačan odgovor.'
                              : "Koji od ponuđeni brojeva predstavlja broj " +
                                  widget.harf.images[tacan]["name"],
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: SizeConfig.blockSizeHorizontal * 5,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
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
                          _backValueColors[(indexColor / 2).floor()],
                      value: indexColor / 10,
                      valueColor: _valueColors[(indexColor / 2).floor()],
                      direction: Axis.horizontal,
                      borderRadius: 10,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 1,
                  ),
                  widget.harf.id != "21"
                      ? Container(
                          height: SizeConfig.blockSizeVertical * 6,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeVertical * 7,
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              playAudio(widget.harf, tacan);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Icon(
                                      Icons.replay,
                                      color: Colors.white,
                                      size: SizeConfig.blockSizeVertical * 4.5,
                                    ),
                                  ),
                                  Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
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
                        )
                      : Container(),
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
