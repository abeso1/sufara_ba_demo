import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/checkInternet.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/models/opis_model.dart';
import 'package:sufara_ba_demo/models/opis_model_naslov.dart';
import 'package:sufara_ba_demo/models/shared_prefs.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:sufara_ba_demo/widgets/custom_alert_no_internet.dart';
import 'package:sufara_ba_demo/widgets/table_izgovor.dart';
import 'package:sufara_ba_demo/widgets/youtube_widget.dart';

class LekcijaScreen extends StatefulWidget {
  final HarfModel harf;
  final String dir;
  Opis opis;
  final AudioPlayer player = AudioPlayer();
  int mjesto = 3;
  final OpisNaslov nalsov = OpisNaslov();
  int colorIndex = -1;

  LekcijaScreen(this.harf, this.dir) {
    opis = Opis(this.dir);
  }

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
  SharedPrefs sharedPrefs = SharedPrefs();

  playAudio(HarfModel harf, int index, {bool isTop = false}) async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print(isTop
        ? '$dir/audio/${harf.id}/${harf.topIcons[index]['name']}.mp3'
        : '$dir/audio/${harf.id}/${harf.images[index]['name']}.mp3');
    if (harf.images[index]['audio'] == "x") {
      return;
    }
    if (widget.player.state == AudioPlayerState.PLAYING) {
    } else {
      Timer(
        Duration(milliseconds: 0),
        () async {
          if ((harf.images[index]['audio'].isEmpty && !isTop) ||
              (isTop && harf.topIcons[index]['audio'].isEmpty)) {
            await widget.player.play(
                isTop
                    ? '$dir/audio/${harf.id}/${harf.topIcons[index]['name']}.mp3'
                    : '$dir/audio/${harf.id}/${harf.images[index]['name']}.mp3',
                isLocal: true);
            setState(() {});
          } else {
            await widget.player.play(
                isTop
                    ? '$dir/audio/${harf.id}/${harf.topIcons[index]['audio']}.mp3'
                    : '$dir/audio/${harf.id}/${harf.images[index]['audio']}.mp3',
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
    int vjezbaId = int.parse(widget.harf.id);
    widget.mjesto = 3;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        elevation: 0,
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            '${widget.harf.id}. lekcija',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
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
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 3,
                    right: SizeConfig.blockSizeHorizontal * 3,
                    top: SizeConfig.blockSizeVertical * 1,
                  ),
                  width: SizeConfig.blockSizeHorizontal * 100,
                  child: Container(
                    //padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white24,
                    ),
                    //color: Colors.white24,
                    //width: SizeConfig.blockSizeHorizontal * 70,
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
                            playAudio(widget.harf, 2, isTop: true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.file(
                                File(
                                    '${widget.dir}/svg/${widget.harf.id}/${widget.harf.topIcons[2]['name']}.svg'),
                                width: SizeConfig.blockSizeHorizontal * 16,
                                color: Colors.white,
                              ),
                              widget.harf.topIcons[2]['desc'].length == 0
                                  ? Container()
                                  : Text(
                                      widget.harf.topIcons[2]['desc'],
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, 1, isTop: true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.file(
                                File(
                                    '${widget.dir}/svg/${widget.harf.id}/${widget.harf.topIcons[1]['name']}.svg'),
                                width: SizeConfig.blockSizeHorizontal * 16,
                                color: Colors.white,
                              ),
                              widget.harf.topIcons[1]['desc'].length == 0
                                  ? Container()
                                  : Text(
                                      widget.harf.topIcons[1]['desc'],
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            playAudio(widget.harf, 0, isTop: true);
                          },
                          child: Row(
                            children: [
                              SvgPicture.file(
                                File(
                                    '${widget.dir}/svg/${widget.harf.id}/${widget.harf.topIcons[0]['name']}.svg'),
                                width: SizeConfig.blockSizeHorizontal * 16,
                                color: Colors.white,
                              ),
                              widget.harf.topIcons[0]['desc'].length == 0
                                  ? Container()
                                  : Text(
                                      widget.harf.topIcons[0]['desc'],
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                            ],
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),

                          //color: Colors.blue,
                          width: SizeConfig.blockSizeVertical * 90,
                          //height: SizeConfig.blockSizeVertical * 15,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                accentColor: Colors.white,
                                unselectedWidgetColor: Colors.white),
                            child: ExpansionTile(
                              backgroundColor: Colors.blue,
                              title: Container(
                                padding: EdgeInsets.fromLTRB(
                                  SizeConfig.blockSizeHorizontal * 11,
                                  0,
                                  0,
                                  0,
                                ),
                                height: SizeConfig.blockSizeVertical * 15,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.book_outlined,
                                      size: SizeConfig.blockSizeHorizontal * 10,
                                      color: Colors.white,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'OPIS LEKCIJE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal *
                                                  7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: SizeConfig.blockSizeVertical * 1,
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2,
                                  ),
                                  child: Column(
                                    children: [
                                      widget.nalsov.getOpis(
                                        int.parse(widget.harf.id) - 1,
                                      ),
                                      widget.opis.getOpis(
                                          int.parse(widget.harf.id) - 1),
                                      widget.harf.tabela["ime"].length != 0
                                          ? Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                                0,
                                                0,
                                              ),
                                              child: Text(
                                                widget.harf.tabela["ime"],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.green[700],
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      3,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      widget.harf.tabela["ime"].length != 0
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    1,
                                                0,
                                                SizeConfig.blockSizeVertical *
                                                    3,
                                              ),
                                              child: TableIzgovor(
                                                  widget.dir, widget.harf, ""),
                                            )
                                          : Container(),
                                      widget.harf.tabela["ime2"].length != 0
                                          ? Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                                0,
                                                0,
                                              ),
                                              child: Text(
                                                widget.harf.tabela["ime2"],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.green[700],
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      3,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      widget.harf.tabela["ime2"].length != 0
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    1,
                                                0,
                                                SizeConfig.blockSizeVertical *
                                                    3,
                                              ),
                                              child: TableIzgovor(
                                                  widget.dir, widget.harf, "2"),
                                            )
                                          : Container(),
                                      widget.harf.tabela["ime2"].length != 0
                                          ? Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                                0,
                                                0,
                                              ),
                                              child: Text(
                                                widget.harf.tabela["ime3"],
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Colors.green[700],
                                                  fontSize: SizeConfig
                                                          .blockSizeVertical *
                                                      3,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                      widget.harf.tabela["ime3"].length != 0
                                          ? Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                SizeConfig.blockSizeHorizontal *
                                                    1,
                                                0,
                                                SizeConfig.blockSizeVertical *
                                                    3,
                                              ),
                                              child: TableIzgovor(
                                                  widget.dir, widget.harf, "3"),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 2,
                        ),
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
                                CheckForInternetService()
                                    .checkForInternet()
                                    .then((value9) {
                                  if (value9) {
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
                                                  height: SizeConfig
                                                          .blockSizeVertical *
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
                                  } else {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (ctx) {
                                        return NoInternetConnection();
                                      },
                                    );
                                  }
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
                                    Icons.ondemand_video,
                                    size: SizeConfig.blockSizeHorizontal * 10,
                                    color: Colors.white,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'VIDEO LEKCIJA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal * 7,
                                      ),
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
                        widget.harf.id != "21"
                            ? SizedBox(
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
                                        width:
                                            SizeConfig.blockSizeHorizontal * 6,
                                      ),
                                      Icon(
                                        Icons.report_outlined,
                                        size:
                                            SizeConfig.blockSizeHorizontal * 10,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 1,
                                      ),
                                      Flexible(
                                        child: AutoSizeText(
                                          'Klikom na harf poslušajte njegov izgovor. ',
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize:
                                                SizeConfig.blockSizeHorizontal *
                                                    5,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            SizeConfig.blockSizeHorizontal * 3,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container()
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
                        int x = widget.harf.images[index]['name'].length +
                            widget.harf.images[index]['desc'].length * 7;
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
                          z = widget.harf.images[c]['name'].length +
                              widget.harf.images[c]['desc'].length * 7;
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
                            child: widget.harf.images[index]['desc'].length != 0
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.file(
                                            File(
                                              '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[index]['name']}.svg',
                                            ),
                                            height:
                                                SizeConfig.blockSizeVertical *
                                                    15,
                                          ),
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              widget.harf.images[index]['desc'],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 34,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : SvgPicture.file(
                                    File(
                                      '${widget.dir}/svg/${widget.harf.id}/${widget.harf.images[index]['name']}.svg',
                                    ),
                                    height: SizeConfig.blockSizeVertical * 15,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                  //zapocni vjezbu
                  FutureBuilder(
                      future: sharedPrefs
                          .readData("vjezba" + (vjezbaId - 3).toString()),
                      builder: (context, snapshot) {
                        if (snapshot.data == true || vjezbaId == 1) {
                          return Container(
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
                                  gradient: LinearGradient(
                                      colors: [kon_boja, poc_boja]),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
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
                          );
                        } else {
                          return Container();
                        }
                      }),
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
