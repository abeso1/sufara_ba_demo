import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';

import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sufara_ba_demo/models/checkInternet.dart';
import 'package:sufara_ba_demo/widgets/custom_alert_no_internet.dart';
import 'package:sufara_ba_demo/widgets/doyYouWantToDownloadFiles.dart';
import 'package:sufara_ba_demo/widgets/message_hadis.dart';
import 'package:sufara_ba_demo/widgets/progression_indicator.dart';

class Tabela10 extends StatefulWidget {
  final String dir;
  final AudioPlayer player = AudioPlayer();

  Tabela10(this.dir);

  @override
  _Tabela10State createState() => _Tabela10State();
}

class _Tabela10State extends State<Tabela10> {
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
                                            '$value/audio/10/$i.mp3',
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
                            '$value/audio/10/$i.mp3',
                            isLocal: true);
                        setState(() {});
                      });
                    },
                  ),
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Table(
      border: TableBorder.all(
          color: Colors.black, width: 1, style: BorderStyle.solid),
      children: [
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              alignment: Alignment.center,
              color: grey_color,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "NE\nČITA\nSE",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(color: poc_boja, fontSize: 16),
                      ),
                    ),
                  )),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/10/t7.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/10/t14.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/10/t21.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/10/t28.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "UN",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("un");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t6.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("un");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t13.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("un");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t20.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("un");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t27.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  ////color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "IN",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("in");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t5.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("in");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t12.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("in");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t19.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("in");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t26.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "EN",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("en");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t4.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("en");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t11.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("en");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t18.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("en");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t25.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "U",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("u");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t3.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("u");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t10.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("u");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t17.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("u");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t24.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "I",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("i");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t2.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("i");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t9.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("i");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t16.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("i");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t23.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.fill,
            child: Container(
              color: grey_color,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: grey_color,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "E",
                      style: TextStyle(color: poc_boja, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("e");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t1.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("e");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t8.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("e");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t15.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  playAudio("e");
                },
                child: SvgPicture.asset(
                  'assets/svg/10/t22.svg',
                  height: SizeConfig.blockSizeVertical * 13,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
