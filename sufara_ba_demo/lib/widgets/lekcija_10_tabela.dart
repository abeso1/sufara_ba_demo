import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class Tabela10 extends StatefulWidget {
  final String dir;
  final AudioPlayer player = AudioPlayer();

  Tabela10(this.dir);

  @override
  _Tabela10State createState() => _Tabela10State();
}

class _Tabela10State extends State<Tabela10> {
  playAudio(String i) {
    if (widget.player.state == AudioPlayerState.PLAYING) {
    } else {
      Timer(
        Duration(milliseconds: 0),
        () async {
          await widget.player
              .play('${widget.dir}/audio/10/$i.mp3', isLocal: true);
          setState(() {});
        },
      );
    }
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
              color: Colors.grey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      "NE ČITA SE",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(color: poc_boja, fontSize: 16),
                    ),
                  )),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t7.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t14.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t21.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t28.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t6.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t13.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t20.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t27.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t5.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t12.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t19.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t26.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t4.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t11.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t18.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t25.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t3.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t10.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t17.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t24.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t2.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t9.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t16.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t23.svg'),
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
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t1.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t8.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t15.svg'),
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
                child: SvgPicture.file(
                  File('${widget.dir}/svg/10/t22.svg'),
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
