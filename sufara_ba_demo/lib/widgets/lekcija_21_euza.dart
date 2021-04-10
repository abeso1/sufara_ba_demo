import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Euza extends StatefulWidget {
  final String dir;
  final AudioPlayer player = AudioPlayer();

  Euza(this.dir);

  @override
  _EuzaState createState() => _EuzaState();
}

class _EuzaState extends State<Euza> {
  playAudio(String i) {
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
    }
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
                  child: SvgPicture.file(
                    File('${widget.dir}/svg/21/euzubila.svg'),
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
                  child: SvgPicture.file(
                    File('${widget.dir}/svg/21/bismila.svg'),
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
                  child: SvgPicture.file(
                    File('${widget.dir}/svg/21/saekallahulazim.svg'),
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
