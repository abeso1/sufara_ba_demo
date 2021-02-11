import 'dart:io';
import 'package:flutter/foundation.dart';

///funkcija za provjeru interneta slanjem request-a na google.com

class CheckForInternetService{
  Future<bool> checkForInternet() async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
  }
