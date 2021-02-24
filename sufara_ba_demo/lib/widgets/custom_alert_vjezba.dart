import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CustomAlertVjezba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Text(
        'Uspješno ste položili vježbu!',
        textAlign: TextAlign.start,
      ),
      actionsPadding: EdgeInsets.only(bottom: 10),
      actions: [
        Container(
          width: 120,
          child: RaisedButton(
            color: Colors.green,
            child: Text(
              'Zatvori prozor',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
