import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class CustomAlert extends StatefulWidget {
  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  bool progres = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      titlePadding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 5,
      ),
      title: Text(
        'Preuzmi potrebne podatke za aplikaciju?',
        textAlign: TextAlign.center,
      ),
      children: [
        //SizedBox(
        //  height: SizeConfig.blockSizeVertical * 3,
        //),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.green,
              onPressed: () async {
                setState(() {
                  progres = true;
                });
                //_download.downloadAndUnzip().then((value) {
                Navigator.of(context).pop(true);
                //});
              },
              child: Text(
                'Da',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 10,
            ),
            RaisedButton(
              color: Colors.grey[200],
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('Odustani'),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 3,
        ),

        ///ovo je drugi neki nacin za progression
        /*progres ? Container(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: 0.0,
              backgroundColor: Colors.grey,
            ),
          ),
        ) : Container(
          height: SizeConfig.blockSizeVertical * 2,
        ),*/
      ],
    );
  }
}
