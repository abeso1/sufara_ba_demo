import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';

class ProgressionIndicator extends StatefulWidget {
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  //var progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final progress = Provider.of<Download>(context, listen: false).progress;
    return SimpleDialog(
      children: [
        Container(
          height: 250,
          width: 250,
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
                  '$progress%',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
