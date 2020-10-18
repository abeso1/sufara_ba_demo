import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class MessageHadis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      children: [
        Container(
          height: SizeConfig.blockSizeVertical * 27,
          width: SizeConfig.blockSizeHorizontal * 25,
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal * 3,
            vertical: SizeConfig.blockSizeVertical * 2,
          ),
          child: Column(
            children: [
              Text(
                //ovo treba nesto ljepse
                'Učite Kur\'an, jer će, uistinu, on doći na Sudnji dan kao zagovornik onima koji ga budu učili.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 2,
              ),
              RaisedButton(
                color: kon_boja,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Zatvori prozor',
                  /*style: TextStyle(
                    //color: Colors.white,
                  ),*/
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
