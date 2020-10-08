import 'dart:io';
import 'dart:async';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class Download {
  Future<bool> checkFile() async {
    Directory directory = await path.getExternalStorageDirectory();
    String downloadPath = '${directory.path}/Audio';
    Directory downloadDir = Directory(downloadPath);
    return downloadDir.existsSync();
  }

  Future<void> downloadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('audio');
    final Directory directory = await path.getExternalStorageDirectory();
    final String downloadPath = '${directory.path}/audio';

    try {
      final File file = File('$downloadPath/audio');

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
  }

  unZipFile(var zippedFile) async {
    Directory directory = await path.getExternalStorageDirectory();
    var bytes = zippedFile.readAsBytesSync();
    var archive = ZipDecoder().decodeBytes(bytes);
    for (var file in archive) {
      var fileName = '$directory/${file.name}';
      if (file.isFile) {
        var outFile = File(fileName);
        outFile = await outFile.create(recursive: true);
        await outFile.writeAsBytes(file.content);
      }
    }
  }
}
