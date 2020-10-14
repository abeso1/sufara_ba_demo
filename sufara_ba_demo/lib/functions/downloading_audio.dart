import 'dart:io' as io;
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
//import 'package:firebase_storage/firebase_storage.dart';

class Download {
  static var httpClient = new io.HttpClient();
//fun checkFile treba provjeravati da li vec ima otpakovan zip file i da se uvijek ne mora skidati
//ova funkcija radi
//tebi ce abi prvi put da se skine i nikad vise
//prati debug console prvu put kad pokrenes
//vidjet ces sve fileove da su otpakovani
  Future<bool> checkFile() async {
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    if (io.Directory('$dir/audio/1').existsSync()) {
      print('postoji');
    }
    //ovo treba
    //return io.Directory(
    //        '$dir/audio/1')
    //    .existsSync();
    return false;
  }

//ovo radi
  Future<io.File> downloadFile(String url, String filename) async {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    io.File file = new io.File('$dir/$filename');
    await file.writeAsBytes(bytes);
    print('$dir/$filename');
    return file;
  }

//ovo radi
  Future<bool> unZipFile(var zippedFile) async {
    String directory = (await path.getApplicationDocumentsDirectory()).path;
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      if (file.isFile) {
        var outFile = io.File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
      print('$directory/${file.name}');
    }
    return true;
  }

  Future<bool> downloadAndUnzip() async {
    downloadFile(
      'https://firebasestorage.googleapis.com/v0/b/sufaramobile.appspot.com/o/audio.zip?alt=media&token=016531db-bde8-4bb3-82f2-7bc8ddf770a9',
      'audio.zip',
    ).then(
      (value) => {
        unZipFile(value),
      },
    );
    return true;
  }
}
