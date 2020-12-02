import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class HarfWidgetForVjezbe extends StatefulWidget {
  final HarfModel harf;
  final String dir;

  HarfWidgetForVjezbe(this.harf, this.dir);

  @override
  _HarfWidgetForVjezbeState createState() => _HarfWidgetForVjezbeState();
}

class _HarfWidgetForVjezbeState extends State<HarfWidgetForVjezbe> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VjezbaScreen(widget.harf, widget.dir),
          ),
        );
      },
      child: GridTile(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15,
          //color: Colors.grey[200],
          //shadowColor: Colors.green,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Flexible(
                                  child: Text(
                    '${widget.harf.id}. vježba',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                SvgPicture.file(
                  File(
                      '${widget.dir}/svg/${widget.harf.id}/${widget.harf.imageUrl}.svg'),
                  color: Colors.green,
                  height: SizeConfig.blockSizeVertical * 10,
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    widget.harf.name,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
