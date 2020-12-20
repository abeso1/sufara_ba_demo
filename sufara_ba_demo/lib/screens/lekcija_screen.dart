import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/opis_model.dart';
import 'package:sufara_ba_demo/models/opis_model_naslov.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:sufara_ba_demo/widgets/youtube_widget.dart';

class LekcijaScreen extends StatefulWidget {
  final HarfModel harf;
  final String dir;
  final AudioPlayer player = AudioPlayer();
  int mjesto = 3;
  final Opis opis = Opis();
  final OpisNaslov nalsov = OpisNaslov();
  int colorIndex = -1;

  LekcijaScreen(this.harf, this.dir);

  @override
  _LekcijaScreenState createState() => _LekcijaScreenState();
}

class _LekcijaScreenState extends State<LekcijaScreen> {
  //int mjesto = 3;
  Color firstButton = Colors.blue;
  Color secondButton = Colors.orange;
  Color thirdButton = Colors.red;
  TransformationController controller = TransformationController();
  bool showContainer = false;

  playAudio(HarfModel harf, int index) async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('$dir/audio/${harf.id}/${harf.images[index]}.mp3');
    if (widget.player.state == AudioPlayerState.PLAYING) {
    } else {
      Timer(
        Duration(milliseconds: 0),
        () async {
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
    widget.mjesto = 3;
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
                      fontSize: SizeConfig.blockSizeHorizontal * 6.8,
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
                            playAudio(widget.harf, 2);
                          },
                          child: SvgPicture.file(
                            File(
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[2]['name']}.svg'),
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
                            playAudio(widget.harf, 0);
                          },
                          child: SvgPicture.file(
                            File(
                                '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[0]['name']}.svg'),
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
              height: SizeConfig.blockSizeVertical * 64.5,
              padding: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal * 3,
                SizeConfig.blockSizeVertical * 2,
                SizeConfig.blockSizeHorizontal * 3,
                0,
              ),
              width: SizeConfig.blockSizeHorizontal * 100,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  //three buttons
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      children: [
                        SizedBox(
                          width: SizeConfig.blockSizeVertical * 90,
                          height: SizeConfig.blockSizeVertical * 15,
                          child: RaisedButton(
                            color: firstButton,
                            onPressed: () {
                              setState(
                                () {
                                  if (showContainer)
                                    showContainer = false;
                                  else
                                    showContainer = true;
                                  /*firstButton = Colors.blue;
                                  showDialog(
                                    //barrierDismissible: false,
                                    context: context,
                                    child: AlertDialog(
                                      scrollable: true,
                                      title: Center(
                                        child: widget.nalsov.getOpis(
                                          int.parse(widget.harf.id) - 1,
                                        ),
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          widget.opis.getOpis(
                                              int.parse(widget.harf.id) - 1),
                                          SizedBox(
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: kon_boja,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Text(
                                                'Zatvori prozor',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );*/
                                },
                              );
                            },
                            hoverColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  size: SizeConfig.blockSizeHorizontal * 10,
                                  color: Colors.white,
                                ),
                                Text(
                                  'OPIS LEKCIJE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 7,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
                        showContainer
                            ? Container(
                                child: Column(
                                  children: [
                                    widget.nalsov.getOpis(
                                      int.parse(widget.harf.id) - 1,
                                    ),
                                    widget.opis
                                        .getOpis(int.parse(widget.harf.id) - 1),
                                    SizedBox(
                                      height: SizeConfig.blockSizeVertical * 2,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        if (widget.harf.imageIshodiste.isNotEmpty)
                          SizedBox(
                            width: SizeConfig.blockSizeVertical * 90,
                            height: SizeConfig.blockSizeVertical * 15,
                            child: RaisedButton(
                              color: secondButton,
                              onPressed: () {
                                setState(() {
                                  secondButton = Colors.orange;
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    child: AlertDialog(
                                      title: Text(
                                        "Ishodište",
                                        style: TextStyle(
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize:
                                              SizeConfig.blockSizeVertical * 4,
                                          fontFamily: "Roboto",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 52.8,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: SizeConfig
                                                          .blockSizeVertical *
                                                      1,
                                                  color: Colors.blue[100],
                                                ),
                                              ),
                                              child: InteractiveViewer(
                                                transformationController:
                                                    controller,
                                                onInteractionEnd:
                                                    (ScaleEndDetails
                                                        endDetails) {
                                                  controller.value =
                                                      Matrix4.identity();
                                                },
                                                //constrained: false,
                                                child: Image.asset(
                                                  widget.harf.imageIshodiste,
                                                  //width: SizeConfig
                                                  //        .blockSizeHorizontal *
                                                  //    90,
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      40,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: SizeConfig
                                                      .blockSizeHorizontal *
                                                  2,
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              color: kon_boja,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: Text(
                                                  'Zatvori prozor',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.report_outlined,
                                      size: SizeConfig.blockSizeHorizontal * 10,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'ISHODIŠTE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 7,
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        else
                          SizedBox(),
                        if (widget.harf.imageIshodiste.isNotEmpty)
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          )
                        else
                          SizedBox(),
                        if (widget.harf.videoUrl.isNotEmpty)
                          SizedBox(
                            width: SizeConfig.blockSizeVertical * 90,
                            height: SizeConfig.blockSizeVertical * 15,
                            child: RaisedButton(
                              color: thirdButton,
                              onPressed: () {
                                setState(() {
                                  thirdButton = Colors.red;
                                });
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  child: SimpleDialog(
                                    children: [
                                      Column(
                                        children: [
                                          YoutubeDefaultWidget(
                                              widget.harf.videoUrl),
                                          SizedBox(
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      2),
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: kon_boja,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Text(
                                                'Zatvori prozor',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.ondemand_video,
                                    size: SizeConfig.blockSizeHorizontal * 10,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'VIDEO LEKCIJA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          SizedBox(),
                        if (widget.harf.videoUrl.isNotEmpty)
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 2,
                          )
                        else
                          SizedBox(),
                        SizedBox(
                          width: SizeConfig.blockSizeVertical * 90,
                          height: SizeConfig.blockSizeVertical * 15,
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
                                    'Klikom na harf poslušajte njegov izgovor. ',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 5,
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
                        )
                      ],
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
                      crossAxisCount: 3,
                      reverse: true,
                      staggeredTileBuilder: (int index) {
                        index = widget.harf.images.length - index - 1;
                        int x = widget.harf.images[index]['name'].length;
                        int y = (x / 7).ceil();
                        if (y > 3) y = 3;
                        if (index == 0) return StaggeredTile.fit(widget.mjesto);
                        int z = 0, w = 0;
                        int c = index - 1;
                        if (c == 0) {
                          int u = widget.mjesto;
                          widget.mjesto = 3;
                          return StaggeredTile.fit(u);
                        }

                        if (c < widget.harf.images.length) {
                          z = widget.harf.images[c]['name'].length;
                          w = (z / 7).ceil();
                          if (w > 3) w = 3;
                        }

                        if (widget.mjesto >= y) {
                          if (w + y > widget.mjesto) {
                            int u = widget.mjesto;
                            widget.mjesto = 3;
                            return StaggeredTile.fit(u);
                          }
                          widget.mjesto = widget.mjesto - y;
                          if (widget.mjesto == 0) {
                            widget.mjesto = 3;
                          }
                          return StaggeredTile.fit(y);
                        }
                        if (widget.mjesto == 2 && y == 3) {
                          widget.mjesto = 3;
                          return StaggeredTile.fit(y);
                        }
                        if (widget.mjesto == 3 && y > 1 && (w == 1 || w == 2)) {
                          return StaggeredTile.fit(3);
                        }
                        return StaggeredTile.fit(y);
                      },
                      itemBuilder: (context, index) {
                        index = widget.harf.images.length - index - 1;
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
                              //color: Colors.green,
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
                      right: SizeConfig.blockSizeHorizontal * 3,
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
                              LinearGradient(colors: [kon_boja, poc_boja]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: FittedBox(
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
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
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
