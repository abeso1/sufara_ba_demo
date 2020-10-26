import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:flutter/cupertino.dart';

class ProgressionIndicator extends StatefulWidget {
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  double progress = 0;
  String text = 'Preuzimanje podataka...';
  Download download = Download();
  bool isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // progress = Provider.of<Download>(context, listen: false).progress;
    SizeConfig().init(context);
    return SimpleDialog(
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            if (progress < 100) {
              progress = download.downloadProgress;
              print(progress);
              if (progress > 0.99290) {
                Timer(Duration(milliseconds: 200), () {
                  Navigator.of(context).pop();
                });
              }
            }

            if (isInit) {
              download
                  .downloadAndUnzipAudio(setState)
                  .then((value) => download.downloadAndUnzipSvg(setState))
                  .then((val) {
                isInit = false;
              });
            }

            return Container(
              height: SizeConfig.blockSizeVertical * 40,
              width: SizeConfig.blockSizeHorizontal * 25,
              padding: EdgeInsets.all(50),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 20,
                    value: progress,
                  ),
                  Center(
                    child: Text(
                      '${(progress * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Container(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
