import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ribbon/ribbon.dart';
import 'package:sufara_ba_demo/models/harf_model.dart';
import 'package:sufara_ba_demo/screens/vjezba_screen.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';


class HarfWidgetForVjezbe extends StatelessWidget {
  final HarfModel harf;

  HarfWidgetForVjezbe(this.harf);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VjezbaScreen(harf),
          ),
        );
      },
      child: GridTile(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15,
          color: Colors.grey[200],
          //shadowColor: Colors.green,
          child: Ribbon(
            farLength: 60,
            nearLength: 30,
            title: 'Zavrseno',
            color: Colors.green[300],
            titleStyle: TextStyle(
              //backgroundColor: Colors.red,
              color: Colors.white,
              fontSize: 13,
            ),
            location: RibbonLocation.topEnd,
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
                    '/data/user/0/com.example.sufara_ba_demo/app_flutter/svg/${harf.id}/${harf.imageUrl}.svg',
                    color: Colors.green,
                    height: SizeConfig.blockSizeVertical * 10,
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
        ),
      ),
    );
  }
}
