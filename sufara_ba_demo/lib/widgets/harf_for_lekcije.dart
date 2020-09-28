import 'package:flutter/material.dart';

import 'package:sufara_ba_demo/models/harf_model.dart';

class HarfWidgetForLekcije extends StatelessWidget {
  final HarfModel harf;

  HarfWidgetForLekcije(this.harf);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(harf.name),
    );
  }
}