import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class MessageHadis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      title: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          "Želimo Vam uspješno učenje sufare",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
          ),
        ),
      ),
      children: [
        Container(
          height: SizeConfig.blockSizeVertical * 26,
          width: SizeConfig.blockSizeHorizontal * 28,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeVertical * 1,
          ),
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 15,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 2,
                  vertical: SizeConfig.blockSizeVertical * 1,
                ),
                child: Flexible(
                  child: Text(
                    'Učite Kur\'an, jer će, uistinu, on doći na Sudnji dan kao zagovornik onima koji ga budu učili.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              Container(
                width: SizeConfig.blockSizeHorizontal * 35,
                height: SizeConfig.blockSizeVertical * 7,
                child: RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      'Zatvori prozor',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
