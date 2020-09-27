import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lime,
        accentColor: Colors.green[400],
      ),
      debugShowCheckedModeBanner: false,
      home: TabsScreens(),
    );
  }
}
