import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CustomAlertVjezbaLocked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Container(
        width: 400,
        child: Text(
          'Ova vježba je trenutno zaključana. Položite sve prethodne vježbe da bi otključali ovu.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.left,
        ),
      ),
      actionsPadding: EdgeInsets.only(bottom: 10),
      actions: [
        Container(
          width: 120,
          child: RaisedButton(
            color: Colors.green,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Zatvori prozor',
              ),
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
