import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class Download {
  Future<bool> checkFile() async {
    Directory directory = await path.getExternalStorageDirectory();
    String downloadPath = '${directory.path}/';
    Directory downloadDir = Directory(downloadPath);
    return downloadDir.existsSync();
  }

  Future<void> downloadFile() async{
    StorageReference storageReference = FirebaseStorage.instance.ref();
    final Directory directory = await path.getExternalStorageDirectory();
    final String downloadPath = '${directory.path}/';


    try{
      final File file = File('$downloadPath/');
      
      if(file.existsSync()){
        return ; 
      }
      else{
        storageReference.writeToFile(file);
      }

    } catch (error) {
      print(error.toString());
    }
  }
}