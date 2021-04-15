import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class DoYouWantToDownloadFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Container(
        width: 400,
        child: Text(
          'Da li želite da preuzmete potrebne podatke za slušanje zvuka? \n(18.3 MB)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.left,
        ),
      ),
      actionsPadding: EdgeInsets.only(bottom: 10, right: 20),
      actions: [
        Container(
          width: 70,
          child: RaisedButton(
            shape: Border.all(color: Colors.grey[300]),
            elevation: 0,
            color: Colors.white,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Ne',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 70,
          child: RaisedButton(
            color: Colors.green,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Da',
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ),
      ],
    );
  }
}
