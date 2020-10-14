import 'dart:io' as io;
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
//import 'package:firebase_storage/firebase_storage.dart';

class Download extends ChangeNotifier {
  static var httpClient = new io.HttpClient();
  double progress;
  var length;

  double downloadProgress() {
    return progress;
  }

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
    length = response.contentLength;
    progress = 0.5;
    notifyListeners();
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
    var archiveLength = archive.length * 2;
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      var fileLength = file.size;
      progress += (fileLength/archiveLength);
      notifyListeners();
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
