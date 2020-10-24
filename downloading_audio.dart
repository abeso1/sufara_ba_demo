import 'dart:io' as io;
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
//import 'package:firebase_storage/firebase_storage.dart';

class Download extends ChangeNotifier {
  static var httpClient = new io.HttpClient();
  double progress;
  var length;
  var dio = Dio();

  get downloadProgress {
    return progress;
  }

  Future<bool> checkFile() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    if (io.Directory('$dir/audio/1').existsSync()) {
      print('postoji');
    }
    //ovo treba
    return (io.Directory('$dir/audio/1').existsSync() &&
        io.Directory('$dir/svg/1').existsSync());
    //return false;
  }

  getProgress() {
    progress += 0.03;
    notifyListeners();
  }

  //ovo radi
  Future<io.File> downloadFile(
      String url, String filename, Function notifyListeners) async {
    //progress = 0.11;
    var request = await httpClient.getUrl(Uri.parse(url));

    var response = await request.close();
    print('$progress');
    //  notifyListeners(() {});
    var bytes = await consolidateHttpClientResponseBytes(response);
    print('3$progress');

    //  notifyListeners(() {});
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('4$progress');

    //  notifyListeners(() {});
    io.File file = new io.File('$dir/$filename');
    print('5$progress');

    // notifyListeners(() {});
    await file.writeAsBytes(bytes);
    print('6$progress');
    // notifyListeners(() {});
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
            'https://drive.google.com/u/1/uc?id=14IvtFtMmhs49opKX0Sts8UihRlDICqik&export=download',
            'audio.zip',
            notifyListeners)
        .then(
      (value) => {unZipFile(value, notifyListeners)},
    );

    return true;
  }

  Future<bool> downloadAndUnzipSvg(Function notifyListeners) async {
    downloadFile(
            'https://drive.google.com/u/1/uc?id=120Z6q-ZAwt4fazv2WV86P-OZNLX_r8bB&export=download',
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
