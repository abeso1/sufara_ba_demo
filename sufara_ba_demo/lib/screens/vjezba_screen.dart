import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';

class VjezbaScreen extends StatefulWidget {
  final HarfModel harf;

  VjezbaScreen(this.harf);

  @override
  _VjezbaScreenState createState() => _VjezbaScreenState();
}

class _VjezbaScreenState extends State<VjezbaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.harf.id}. vjezba',
          //textAlign: TextAlign.right,
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //ovaj gradient treba popraviti
              colors: [Colors.green[800], Colors.lightGreen],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          widget.harf.name,
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
