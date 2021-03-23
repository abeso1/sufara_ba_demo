import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

class TableIzgovor extends StatelessWidget {
  final String dir;
  final HarfModel harf;
  String broj = "";

  TableIzgovor(this.dir, this.harf, this.broj);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 20,
      child: Table(
        border: TableBorder.all(
            color: Colors.black, width: 1, style: BorderStyle.solid),
        children: [
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[400]),
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.baseline,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "IZGOVOR",
                        style: TextStyle(
                          color: poc_boja,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "KRAJ",
                        style: TextStyle(
                          color: poc_boja,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "SREDINA",
                        style: TextStyle(
                          color: poc_boja,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "POČETAK",
                        style: TextStyle(
                          color: poc_boja,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "SAMI",
                        style: TextStyle(
                          color: poc_boja,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      harf.tabela["izgovor" + broj],
                      style: TextStyle(
                        color: Colors.green[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: SvgPicture.file(
                  File('$dir/svg/${harf.id}/${harf.tabela["kraj" + broj]}.svg'),
                  //width: SizeConfig.blockSizeHorizontal * 34,
                  height: SizeConfig.blockSizeVertical * 15,
                  //color: Colors.green,
                ),
              ),
              TableCell(
                child: SvgPicture.file(
                  File(
                      '$dir/svg/${harf.id}/${harf.tabela["sredina" + broj]}.svg'),
                  //width: SizeConfig.blockSizeHorizontal * 34,
                  height: SizeConfig.blockSizeVertical * 15,
                  //color: Colors.green,
                ),
              ),
              TableCell(
                child: SvgPicture.file(
                  File(
                      '$dir/svg/${harf.id}/${harf.tabela["pocetak" + broj]}.svg'),
                  //width: SizeConfig.blockSizeHorizontal * 34,
                  height: SizeConfig.blockSizeVertical * 15,
                  //color: Colors.green,
                ),
              ),
              TableCell(
                child: SvgPicture.file(
                  File('$dir/svg/${harf.id}/${harf.tabela["sami" + broj]}.svg'),
                  //width: SizeConfig.blockSizeHorizontal * 34,
                  height: SizeConfig.blockSizeVertical * 15,
                  //color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
