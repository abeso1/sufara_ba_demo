import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as path;

class LekcijaScreen extends StatefulWidget {
  final HarfModel harf;
  final String dir;

  LekcijaScreen(this.harf, this.dir);

  @override
  _LekcijaScreenState createState() => _LekcijaScreenState();
}

class _LekcijaScreenState extends State<LekcijaScreen> {
  int mjesto = 3;

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
              colors: [kon_boja, poc_boja],
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
                  colors: [kon_boja, poc_boja],
                )),
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    //left: SizeConfig.blockSizeHorizontal * 45,
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
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[0]['name']}.svg'),
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
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[1]['name']}.svg'),
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
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[2]['name']}.svg'),
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
                    child: StaggeredGridView.countBuilder(
                      physics: ScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 2,
                        horizontal: SizeConfig.blockSizeHorizontal * 2,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: widget.harf.images.length,
                      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //  crossAxisCount: 3,
                      //childAspectRatio: 3/2,
                      //  mainAxisSpacing: SizeConfig.blockSizeVertical * 1,
                      //  crossAxisSpacing: SizeConfig.blockSizeHorizontal * 1,
                      //),
                      crossAxisCount: 3,
                      staggeredTileBuilder: (int index) {
                        print(mjesto);
                        int x = widget.harf.images[index]['name'].length;
                        int y = (x / 7).ceil();
                        if (y > 3) y = 3;

                        int z = 0, w = 0;
                        int c = index + 1;
                        if (c < widget.harf.images.length) {
                          z = widget.harf.images[c]['name'].length;
                          w = (z / 7).ceil();
                          if (w > 3) w = 3;
                        }

                        if(c == widget.harf.images.length) {
                          return StaggeredTile.fit(mjesto);
                        }

                        if (mjesto >= y) {
                          if(w+y>mjesto){
                            int u = mjesto;
                            mjesto = 3;
                            return StaggeredTile.fit(u);
                          }
                          mjesto = mjesto - y;
                          if (mjesto == 0) {
                            mjesto = 3;
                          }
                          return StaggeredTile.fit(y);
                        }
                        if (mjesto == 2 && y == 3) {
                          mjesto = 3;
                          return StaggeredTile.fit(y);
                        }
                        if (mjesto == 3 && y > 1 && (w == 1 || w == 2)) {
                          return StaggeredTile.fit(3);
                        }
                        return StaggeredTile.fit(y);
                      },
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
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[index]['name']}.svg',
                              ),
                              height: SizeConfig.blockSizeVertical * 15,
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
                            builder: (context) =>
                                VjezbaScreen(widget.harf, widget.dir),
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
                            gradient:
                                LinearGradient(colors: [kon_boja, poc_boja])),
                        child: Text(
                          //ovo treba centrirati
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
