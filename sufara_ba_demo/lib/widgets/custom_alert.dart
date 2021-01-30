import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CustomAlert extends StatefulWidget {
  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  bool progres = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      title: Text(
        'Jeste li sigurni da želite napustiti vježbu?',
        textAlign: TextAlign.justify,
      ),
      actions: [
        Container(
          width: 80,
          child: RaisedButton(
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
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 80,
          child: RaisedButton(
            color: Colors.grey[200],
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Odustani'),
          ),
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
