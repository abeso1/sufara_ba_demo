import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/dummy_data.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/widgets/harf_for_vjezbe.dart';

class Vjezbe extends StatelessWidget {
  final List<HarfModel> listHarf = DUMMY_DATA.listHarfDummyData;

  @override
  Widget build(BuildContext context) {
    return Container(
      //ovdje ide gridview
      child: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return HarfWidgetForVjezbe(listHarf[index]);
        },
        itemCount: listHarf.length,
      ),
    );
  }
}
