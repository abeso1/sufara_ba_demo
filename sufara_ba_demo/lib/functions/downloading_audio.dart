import 'dart:io' as io;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
//import 'package:firebase_storage/firebase_storage.dart';

class Download extends ChangeNotifier {
  static var httpClient = new io.HttpClient();
  double progress = 0.0;
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
    //return io.Directory(
      //      '$dir/audio/1')
        //.existsSync();
    return false;
  }
}
/*
//ovo radi
  Future<io.File> downloadFile(String url, String filename) async {
    /*String dir = (await path.getApplicationDocumentsDirectory()).path;
    io.File file = new io.File('$dir/$filename');
    try {
      Response response = await dio.get(
        url,

        onReceiveProgress: showDownloadProgress,

        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );
      var raf = file.openSync(mode: io.FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }*/
    ////ovo radi za firebase
    ///ovaj za sad radi, ali ne znam kako progres da ispisem
    var request = await httpClient.getUrl(Uri.parse(url));
    progress = 0.1;
//notifyListeners();
    var response = await request.close();
    print('2$progress');
    progress = 0.2;
//notifyListeners();
    var bytes = await consolidateHttpClientResponseBytes(response);
    print('3$progress');
    progress = 0.3;
//notifyListeners();
    String dir = (await path.getApplicationDocumentsDirectory()).path;
    print('4$progress');
    progress = 0.4;
    //notifyListeners();
    io.File file = new io.File('$dir/$filename');
    print('5$progress');
    progress = 0.5;
    //notifyListeners();
    await file.writeAsBytes(bytes);
    print('6$progress');
    progress = 0.6;
    //notifyListeners();
    print('$dir/$filename');
    return file;
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
    progress = (received / total * 100);
    notifyListeners();
  }

//ovo radi
  Future<bool> unZipFile(var zippedFile) async {
    String directory = (await path.getApplicationDocumentsDirectory()).path;
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    var archiveLength = archive.length * 2;
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      //var fileLength = file.size;
      //progress += (fileLength / archiveLength);
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
    /*io.File file = await downloadFile(
      //'https://firebasestorage.googleapis.com/v0/b/sufaramobile.appspot.com/o/audio.zip?alt=media&token=016531db-bde8-4bb3-82f2-7bc8ddf770a9',
      'https://drive.google.com/u/1/uc?id=14IvtFtMmhs49opKX0Sts8UihRlDICqik&export=download',
      'audio.zip',
    );

    await unZipFile(file);*/
//////////https://drive.google.com/u/1/uc?id=14IvtFtMmhs49opKX0Sts8UihRlDICqik&export=download
    downloadFile(
      'https://drive.google.com/u/1/uc?id=14IvtFtMmhs49opKX0Sts8UihRlDICqik&export=download',
      'audio.zip',
    ).then(
      (value) => {
        unZipFile(value),
      },
    );

    return true;
  }
}*/
