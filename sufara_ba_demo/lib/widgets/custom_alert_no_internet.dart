import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class NoInternetConnection extends StatelessWidget {
  final bool download;

  NoInternetConnection({this.download = false});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Text(
        "Nema internet konekcije",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 20),
      ),
      content: Text(
        "Provjerite vašu internet konekciju i pokušajte ponovo!",
        style: TextStyle(fontSize: 16),
      ),
      actionsPadding: EdgeInsets.only(bottom: 10, right: 20),
      actions: [
        Container(
          child: RaisedButton(
            color: Colors.green,
            child: Text(
              Platform.isIOS
                  ? 'Zatvori prozor'
                  : download
                      ? "Zatvori aplikaciju"
                      : "Zatvori prozor",
            ),
            onPressed: () {
              if (Platform.isIOS || !download) {
                Navigator.of(context).pop();
              } else {
                Future.delayed(const Duration(milliseconds: 300), () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                });
              }
            },
          ),
          width: !download ? 120 : 180,
        ),
      ],
    );
  }
}
