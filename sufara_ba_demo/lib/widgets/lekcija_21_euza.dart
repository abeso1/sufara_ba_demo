import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sufara_ba_demo/models/checkInternet.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_no_internet.dart';
import 'package:sufara_ba_demo/widgets/doyYouWantToDownloadFiles.dart';
import 'package:sufara_ba_demo/widgets/message_hadis.dart';
import 'package:sufara_ba_demo/widgets/progression_indicator.dart';

class Euza extends StatefulWidget {
  final String dir;
  final AudioPlayer player = AudioPlayer();

  Euza(this.dir);

  @override
  _EuzaState createState() => _EuzaState();
}

class _EuzaState extends State<Euza> {
  Download download = Download();

  Future<String> getDir() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    return dir;
  }

  playAudio(String i) {
    download.checkFile().then((val) => {
          if (!val)
            {
              CheckForInternetService().checkForInternet().then((value9) {
                if (value9) {
                  Timer(
                    Duration(seconds: 0),
                    () async {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (ctx) {
                          return DoYouWantToDownloadFiles();
                        },
                      ).then((value) {
                        if (value) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (ctx) {
                              return ProgressionIndicator();
                            },
                          ).then(
                            (value) {
                              //Navigator.of(context).pop();
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (ctx) {
                                  return MessageHadis();
                                },
                              ).then((value) {
                                if (widget.player.state ==
                                    AudioPlayerState.PLAYING) {
                                } else {
                                  Timer(
                                    Duration(milliseconds: 0),
                                    () async {
                                      getDir().then((value) async {
                                        await widget.player.play(
                                            '$value/audio/21/$i.mp3',
                                            isLocal: true);
                                        setState(() {});
                                      });
                                    },
                                  );
                                }
                              });
                            },
                          );
                        } else {}
                      });
                    },
                  );
                } else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (ctx) {
                      return NoInternetConnection(download: true);
                    },
                  );
                }
              }),
            }
          else if (val)
            {
              if (widget.player.state == AudioPlayerState.PLAYING)
                {}
              else
                {
                  Timer(
                    Duration(milliseconds: 0),
                    () async {
                      getDir().then((value) async {
                        await widget.player.play(
                            '$value/audio/21/$i.mp3',
                            isLocal: true);
                        setState(() {});
                      });
                    },
                  ),
                }
            }
        });
/*
    if (widget.player.state == AudioPlayerState.PLAYING) {
    } else {
      Timer(
        Duration(milliseconds: 0),
        () async {
          await widget.player
              .play('${widget.dir}/audio/21/$i.mp3', isLocal: true);
          setState(() {});
        },
      );
    }*/
  }

  @override
  void dispose() {
    if (widget.player.state == AudioPlayerState.PLAYING) {
      widget.player.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Na samom početku učenja neke sure ili odlomka iz Kur\'ana, učač treba da izgovori slijedeće riječi:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                playAudio("euzubila");
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/21/euzubila.svg',
                    //width: SizeConfig.blockSizeHorizontal * 34,
                    height: 40,
                    //color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              '(Utječem se Allahu od prokletog šejtana)',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Center(
            child: InkWell(
              onTap: () {
                playAudio("bismila");
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/21/bismila.svg',
                    //width: SizeConfig.blockSizeHorizontal * 34,
                    height: 40,
                    //color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "(U ime Allaha Milostivog Samilosnog)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'A kada završimo sa učenjem Kur\'ana, tada trebamo izgovoriti slijedeće riječi:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                playAudio("saekallahulazim");
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 0.6,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/21/saekallahulazim.svg',
                    //width: SizeConfig.blockSizeHorizontal * 34,
                    height: 40,
                    //color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              "(Istinu je rekao Uzvišeni Allah)",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
