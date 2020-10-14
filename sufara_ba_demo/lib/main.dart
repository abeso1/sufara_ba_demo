import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sufara_ba_demo/functions/downloading_audio.dart';
import 'package:sufara_ba_demo/screens/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Download()),
      ],
          child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lime,
          accentColor: Colors.green[800],
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
