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
  playAudio(String url) async {
    AudioPlayer player = AudioPlayer();
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('$dir/audio/1/$url.mp3');
    await player.play('$dir/audio/1/$url.mp3', isLocal: true);
    setState(() {});
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
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('E');
                          },
                          child: SvgPicture.asset(
                            widget.harf.images[0],
                            height: SizeConfig.blockSizeVertical * 10,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('U');
                          },
                          child: SvgPicture.asset(
                            widget.harf.images[1],
                            height: SizeConfig.blockSizeVertical * 10,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('I');
                          },
                          child: SvgPicture.asset(
                            widget.harf.images[2],
                            height: SizeConfig.blockSizeVertical * 10,
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
                  Text(
                    widget.harf.lekcijaIliVjezbaIndex,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ovjde ide opis harfa
                  Text(
                    widget.harf.opis,
                    //ovako izleda bolje nego kad je centriran
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto',
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
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 3,
                      horizontal: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('E');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 10,
                            child: SvgPicture.asset(
                              widget.harf.images[0],
                              height: SizeConfig.blockSizeVertical * 14,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('U');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 10,
                            child: SvgPicture.asset(
                              widget.harf.images[1],
                              height: SizeConfig.blockSizeVertical * 14,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio('I');
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 10,
                            child: SvgPicture.asset(
                              widget.harf.images[2],
                              height: SizeConfig.blockSizeVertical * 14,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
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
