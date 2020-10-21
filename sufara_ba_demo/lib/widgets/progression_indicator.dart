import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

import 'dart:io' as io;
import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;

class ProgressionIndicator extends StatefulWidget {
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  double progress = 0.11;
  String text = 'Preuzimanje podataka...';

  static var httpClient = new io.HttpClient();
  Future<bool> checkFile() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    /*if (io.Directory('$dir/audio/1').existsSync()) {
      print('postoji');
    }*/
    //ovo treba
    return (io.Directory('$dir/audio/1').existsSync() &&
        io.Directory('$dir/svg/1').existsSync());
    //ovo je za testing samo
    //return false;
  }

//ovo radi
  Future<io.File> downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    setState(() {
      progress += 0.03;
    });
    var response = await request.close();
    print('2$progress');
    setState(() {
      progress += 0.03;
    });
    var bytes = await consolidateHttpClientResponseBytes(response);
    print('3$progress');
    setState(() {
      progress += 0.03;
    });
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('4$progress');
    setState(() {
      progress += 0.03;
    });
    io.File file = new io.File('$dir/$filename');
    print('5$progress');
    setState(() {
      progress += 0.03;
    });
    await file.writeAsBytes(bytes);
    print('6$progress');
    setState(() {
      progress += 0.03;
    });
    print('$dir/$filename');
    return file;
  }

//ovo radi
  Future<bool> unZipFile(var zippedFile) async {
    String directory = (await path.getApplicationDocumentsDirectory()).path;
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    //setState(() {
    //  text = 'Skoro gotovo...';
    //});
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      setState(() {
        progress += 0.0003;
      });
      if (file.isFile) {
        var outFile = io.File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
      print('$directory/${file.name}');
    }
    if(progress > 0.97) Navigator.of(context).pop();
    return true;
  }

  Future<bool> downloadAndUnzipAudio() async {
    downloadFile(
      //ovaj firebaseov link radi, ali za samo mali broj korisnika
      //'https://firebasestorage.googleapis.com/v0/b/sufaramobile.appspot.com/o/audio.zip?alt=media&token=016531db-bde8-4bb3-82f2-7bc8ddf770a9',
      'https://drive.google.com/u/1/uc?id=14IvtFtMmhs49opKX0Sts8UihRlDICqik&export=download',
      'audio.zip',
    ).then(
      (value) => {
        unZipFile(value),
      },
    );

    return true;
  }

  Future<bool> downloadAndUnzipSvg() async {
    downloadFile(
      'https://drive.google.com/u/1/uc?id=120Z6q-ZAwt4fazv2WV86P-OZNLX_r8bB&export=download',
      'svg.zip',
    ).then(
      (value) => {
        unZipFile(value),
      },
    );

    return true;
  }

  @override
  void initState() {
    downloadAndUnzipAudio().then((value) => downloadAndUnzipSvg());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
