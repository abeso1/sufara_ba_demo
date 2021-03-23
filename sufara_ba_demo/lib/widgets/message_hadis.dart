import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class MessageHadis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Text(
        "Želimo Vam uspješno učenje Sufare",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 20),
      ),
      content: Container(
        width: 400,
        child: Text(
          "Učite Kur\'an, jer će, uistinu, on doći na Sudnji dan kao zagovornik onima koji ga budu učili.",
          style: TextStyle(fontSize: 16),
        ),
      ),
      actionsPadding: EdgeInsets.only(bottom: 10, right: 20),
      actions: [
        Container(
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
          width: 120,
        ),
      ],
    );
  }
}
