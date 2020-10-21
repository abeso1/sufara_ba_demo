//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

//import 'dart:io' as io;
//import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/foundation.dart';
//import 'package:path_provider/path_provider.dart' as path;

class ProgressionIndicator extends StatefulWidget {
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  //double progress = 0.11;
  String text = 'Preuzimanje podataka...';
  Download download = Download();

  @override
  void initState() {
    download.downloadAndUnzipAudio().then((value) => download.downloadAndUnzipSvg());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var progress = Provider.of<Download>(context, listen: false).progress;
    SizeConfig().init(context);
    return SimpleDialog(
      children: [
        Container(
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
