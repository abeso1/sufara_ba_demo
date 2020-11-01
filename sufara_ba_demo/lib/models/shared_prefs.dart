import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  setData(String vjezba) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(vjezba, true);
    print(vjezba);
  }

  Future<bool> readData(String vjezba) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool povratni = preferences.getBool(vjezba);
    return povratni;
  }
}
