import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class HarfWidgetForVjezbe extends StatelessWidget {
  final HarfModel harf;

  HarfWidgetForVjezbe(this.harf);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 15,
        shadowColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${harf.id}. vjezba',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                harf.imageUrl,
                color: Colors.green,
                width: SizeConfig.blockSizeHorizontal * 17,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                harf.name,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
