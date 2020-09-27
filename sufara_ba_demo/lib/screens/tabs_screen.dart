import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/screens/lekcije.dart';
import 'package:sufara_ba_demo/screens/vjezbe.dart';

class TabsScreens extends StatefulWidget {
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //ovdje se treba staviti logo Sufara.ba
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Sufara.ba', style: TextStyle(color: Colors.green,),),
          bottom: TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Lekcije',
              ),
              Tab(
                text: 'Vjezbe',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Lekcije(),
          Vjezbe(),
        ]),
      ),
    );
  }
}
