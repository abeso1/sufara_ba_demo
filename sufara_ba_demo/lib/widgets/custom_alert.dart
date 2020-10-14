import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CustomAlert extends StatefulWidget {
  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  Download _download = Download();
  bool progres = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Preuzmi potreban audio za aplikaciju?',
        textAlign: TextAlign.center,
      ),
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                setState(() {
                  progres = true;
                });
                _download.downloadAndUnzip().then((value) {
                  Navigator.of(context).pop(value);
                });
              },
              child: Text('Da'),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 10,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Odustani'),
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical * 1,
        ),
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
