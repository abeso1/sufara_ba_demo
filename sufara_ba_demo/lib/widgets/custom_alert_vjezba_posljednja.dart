import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class CustomAlertVjezbaZadnja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Text(
        'Svaka Vam čast. Uz Allahovu pomoć uspjeli ste naučiti sve harfove. Sada možete da učite u Kur\'anu. Allah Vam dao svako dobro i uputio Vas na pravi put.',
        textAlign: TextAlign.center,
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
