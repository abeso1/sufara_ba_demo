import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as path;

class LekcijaScreen extends StatefulWidget {
  final HarfModel harf;

  LekcijaScreen(this.harf);

  @override
  _LekcijaScreenState createState() => _LekcijaScreenState();
}

class _LekcijaScreenState extends State<LekcijaScreen> {
  String directory = '';

  Future<String> getDir() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    return dir;
  }

  @override
  void initState() {
    getDir().then((value) {
      setState(() {
        directory = value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  playAudio(HarfModel harf, int index) async {
    AudioPlayer player = AudioPlayer();
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('$dir/audio/${harf.id}/${harf.images[index]}.mp3');
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
            fontFamily: 'Roboto',
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
            height: SizeConfig.blockSizeVertical * 20,
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
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Roboto',
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white24,
                    ),
                    //color: Colors.white24,
                    width: SizeConfig.blockSizeHorizontal * 55,
                    height: SizeConfig.blockSizeVertical * 13,
                    /*child: SvgPicture.asset(
                      widget.harf.imageUrl,
                      height: SizeConfig.blockSizeVertical * 6,
                      color: Colors.white,
                    ),*/
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, 0);
                          },
                          child: SvgPicture.file(
                            File(
                                '$directory/svg/${widget.harf.id}/${widget.harf.images[0]['name']}.svg'),
                            width: SizeConfig.blockSizeHorizontal * 16,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, 1);
                          },
                          child: SvgPicture.file(
                            File(
                                '$directory/svg/${widget.harf.id}/${widget.harf.images[1]['name']}.svg'),
                            width: SizeConfig.blockSizeHorizontal * 16,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, 2);
                          },
                          child: SvgPicture.file(
                            File(
                                '$directory/svg/${widget.harf.id}/${widget.harf.images[2]['name']}.svg'),
                            width: SizeConfig.blockSizeHorizontal * 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: SizeConfig.blockSizeVertical * 68.2,
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
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    child: Text(
                      widget.harf.lekcijaIliVjezbaIndex,
                      style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ovjde ide opis harfa
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 1,
                    ),
                    child: Text(
                      widget.harf.opis,
                      //ovako izleda bolje nego kad je centriran
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  //slika grla
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 12,
                      vertical: SizeConfig.blockSizeVertical * 12,
                    ),
                    child: Image.asset(
                      'svg/back_img/throat-e.jpg',
                      height: SizeConfig.blockSizeVertical * 45,
                      fit: BoxFit.fill,
                    ),
                  ),
                  //oblici
                  Container(
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.harf.images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        //childAspectRatio: 3/2,
                        mainAxisSpacing: SizeConfig.blockSizeVertical * 1,
                        crossAxisSpacing: SizeConfig.blockSizeHorizontal * 1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, index);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 10,
                            child: SvgPicture.file(
                              File(
                                  '$directory/svg/${widget.harf.id}/${widget.harf.images[index]['name']}.svg'),
                              height: SizeConfig.blockSizeVertical * 11,
                              color: Colors.green,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //zapocni vjezbu
                  Container(
                    height: SizeConfig.blockSizeVertical * 8,
                    padding: EdgeInsets.only(
                      left: SizeConfig.blockSizeHorizontal * 45,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VjezbaScreen(widget.harf),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeVertical * 1,
                          vertical: SizeConfig.blockSizeVertical * 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [kon_boja, poc_boja],
                          ),
                        ),
                        child: Text(
                          'Započni vježbu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
