import 'dart:io' as io;
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class Download {
  static var httpClient = new io.HttpClient();

  Future<bool> checkFile() {
    if (io.Directory(
            '/storage/emulated/0/Android/data/com.example.sufara_ba_demo/files/audio')
        .existsSync()) {
      print('postoji');
    }
    return io.File(
            '/storage/emulated/0/Android/data/com.example.sufara_ba_demo/files/audio')
        .exists();
  }

  /*Future<void> downloadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('audio');
    final io.Directory directory = await path.getExternalStorageDirectory();
    final String downloadPath = '${directory.path}/audio';

    try {
      final io.File file = io.File('$downloadPath/audio');

      if (file.existsSync()) {
      } else {
        /*await*/ file.createSync(recursive: true);
        storageReference.writeToFile(file);
        unZipFile(file);
      }
    } catch (error) {
      print(error.toString());
    }

    print(downloadPath);
  }*/

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

  unZipFile(var zippedFile) async {
    io.Directory directory = await path.getExternalStorageDirectory();
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      if (file.isFile) {
        var outFile = io.File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }
}
