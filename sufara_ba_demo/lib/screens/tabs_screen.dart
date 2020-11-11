import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/data/language_constants.dart';
import 'package:sufara_ba_demo/main.dart';
import 'package:sufara_ba_demo/models/language.dart';
import 'package:sufara_ba_demo/screens/lekcije.dart';
import 'package:sufara_ba_demo/screens/vjezbe.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class TabsScreens extends StatefulWidget {
  final String dir;
  Color buttonColorBosanski = Colors.white;
  Color buttonColorEnglish = Colors.transparent;
  Color textColorBosanski = Colors.black;
  Color textColorEnglish = Colors.grey;
  String lang = "bosanski";

  TabsScreens(this.dir);

  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  Locale _locale;

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
      //print(_locale.countryCode);
      if (_locale.countryCode == "US") {
        setState(() {
          widget.lang = "english";
          widget.buttonColorBosanski = Colors.grey[300];
          widget.buttonColorEnglish = Colors.white;
          widget.textColorBosanski = Colors.grey;
          widget.textColorEnglish = Colors.black;
        });
      } else if (_locale.countryCode == "BS") {
        setState(() {
          widget.lang = "bosanski";
          widget.buttonColorBosanski = Colors.white;
          widget.buttonColorEnglish = Colors.grey[300];
          widget.textColorBosanski = Colors.black;
          widget.textColorEnglish = Colors.grey;
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //this need to be added so i can use size config
    SizeConfig().init(context);
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
      //print(_locale.countryCode + "ovdje sam");
      if (_locale.countryCode == "US") {
        setState(() {
          widget.lang = "english";
          widget.buttonColorBosanski = Colors.transparent;
          widget.buttonColorEnglish = Colors.white;
          widget.textColorBosanski = Colors.grey;
          widget.textColorEnglish = Colors.black;
        });
      } else if (_locale.countryCode == "BS") {
        setState(() {
          widget.lang = "bosanski";
          widget.buttonColorBosanski = Colors.white;
          widget.buttonColorEnglish = Colors.transparent;
          widget.textColorBosanski = Colors.black;
          widget.textColorEnglish = Colors.grey;
        });
      }
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //ovdje se treba staviti logo Sufara.ba(psotavljen)
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                  0,
                  SizeConfig.blockSizeVertical * 0.65,
                  0,
                  0,
                ),
                child: SvgPicture.asset(
                  'svg/back_img/sufara.ba_logo_splash.svg',
                  width: SizeConfig.blockSizeHorizontal * 13.3,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal * 1,
              ),
              Image.asset(
                'svg/back_img/sufara.png',
                width: SizeConfig.blockSizeHorizontal * 18,
                fit: BoxFit.cover,
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 1,
                  vertical: SizeConfig.blockSizeVertical * 0.5,
                ),
                //width: SizeConfig.blockSizeHorizontal * 40,
                child: Row(
                  children: [
                    Container(
                      /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.yellow[200],
                            Colors.blue[900]
                          ],
                        ),
                      ),*/
                      width: SizeConfig.blockSizeHorizontal * 20,
                      height: SizeConfig.blockSizeVertical * 3,
                      child: RaisedButton(
                        onPressed: () {
                          _changeLanguage(
                            Language(1, "Bosanski", "bs"),
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'Bosanski',
                            style: TextStyle(
                              fontSize: 13,
                              color: widget.textColorBosanski,
                            ),
                          ),
                        ),
                        color: widget.buttonColorBosanski,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Container(
                      /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Box,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.white,
                            Colors.red[200],
                            Colors.blue[900]
                          ],
                        ),
                      ),*/
                      width: SizeConfig.blockSizeHorizontal * 18,
                      height: SizeConfig.blockSizeVertical * 3,
                      child: RaisedButton(
                        onPressed: () {
                          _changeLanguage(
                            Language(2, "English", "en"),
                          );
                        },
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.textColorEnglish,
                            ),
                          ),
                        ),
                        color: widget.buttonColorEnglish,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottom: TabBar(
            labelColor: Colors.green[800],
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                  child: Text(
                getTranslated(context, 'lekcijaTabText'),
                style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
              )),
              Tab(
                child: Text(
                  getTranslated(context, 'vjezbeTabText'),
                  style:
                      TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Lekcije(widget.dir),
          Vjezbe(widget.dir),
        ]),
      ),
    );
  }
}
