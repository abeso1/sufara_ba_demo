import 'dart:io' as io;
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class Download extends ChangeNotifier {
  static var httpClient = new io.HttpClient();
  double progress = 0.12;
  var length;
  var dio = Dio();

  get downloadProgress {
    return progress;
  }

  Future<bool> checkFile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool povratni = sharedPreferences.getBool('preuzeto') ?? false;
    return povratni;
  }

  //ovo radi
  Future<io.File> downloadFile(
      String url, String filename, Function notifyListeners) async {
    var request = await httpClient.getUrl(Uri.parse(url));
      progress += 0.03;
      notifyListeners(() {});
    var response = await request.close();
      progress += 0.03;
      notifyListeners(() {});
    var bytes = await consolidateHttpClientResponseBytes(response);
      progress += 0.03;
      notifyListeners(() {});
    String dir = (await path.getApplicationDocumentsDirectory()).path;
      progress += 0.03;
      notifyListeners(() {});
    io.File file = new io.File('$dir/$filename');
      progress += 0.03;
      notifyListeners(() {});
    await file.writeAsBytes(bytes);
      progress += 0.025;
      print('$dir/$filename');
    notifyListeners(() {});
    return file;
  }

//ovo radi
  Future<bool> unZipFile(var zippedFile, Function notifyListeners) async {
    String directory = (await path.getApplicationDocumentsDirectory()).path;
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    //setState(() {
    //  text = 'Skoro gotovo...';
    //});
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      progress += 0.0003;
      notifyListeners(() {});
      // notifyListeners();
      if (file.isFile) {
        var outFile = io.File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
      print('$directory/${file.name}');
    }
    //if (progress > 0.97) Navigator.of(context).pop();
    return true;
  }

  Future<bool> downloadAndUnzipAudio(Function notifyListeners) async {
    downloadFile(
            //ovaj firebaseov link radi, ali za samo mali broj korisnika
            //'https://firebasestorage.googleapis.com/v0/b/sufaramobile.appspot.com/o/audio.zip?alt=media&token=016531db-bde8-4bb3-82f2-7bc8ddf770a9',
            'https://drive.google.com/u/0/uc?id=1SD00lG0UoXZzLZqcogMX2KBYLb3_G4jQ&export=download',//https://drive.google.com/u/0/uc?id=15gHE1TB3R-ov6cCLZOKDkNKqWdZBCMNU&export=download
            'audio.zip',
            notifyListeners)
        .then(
      (value) => {unZipFile(value, notifyListeners)},
    );

    return true;
  }

  Future<bool> downloadAndUnzipSvg(Function notifyListeners) async {
    downloadFile(
            'https://drive.google.com/u/0/uc?id=1oKBnEF531qaYS57U1uOX6guOiJUQfQA7&export=download',
            'svg.zip',
            notifyListeners)
        .then(
      (value) => {
        unZipFile(value, notifyListeners),
      },
    );

    return true;
  }
}
