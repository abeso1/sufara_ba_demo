import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';

class CustomAlert extends StatefulWidget {
  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  Download _download = Download();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Preuzmi potreban audio za aplikaciju?'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () async {
                _download
                    .downloadAndUnzip()
                    .then(
                  (val) {
                    if (val) {
                      Navigator.of(context).pop(0);
                      print('radi ovo!!!');
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                );
                print('amer');
              },
              child: Text('Da'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Odustani'),
            ),
          ],
        )
      ],
    );
  }
}
