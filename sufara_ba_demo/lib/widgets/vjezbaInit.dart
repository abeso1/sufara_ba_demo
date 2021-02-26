import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/settings/size_config.dart';

class VjezbaInit extends StatelessWidget {
  final String vjezbaId;

  VjezbaInit(this.vjezbaId);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AlertDialog(
      title: Container(
        width: 400,
        child: Text(
          'Dobro došli u vježbu broj $vjezbaId. Ne zaboravite da pojačate zvuk na Vašem telefonu i neka Vam je s hajrom!',
          textAlign: TextAlign.left,
        ),
      ),
      actionsPadding: EdgeInsets.only(bottom: 10),
      actions: [
        Container(
          width: 120,
          child: RaisedButton(
            color: Colors.green,
            child: Text(
              'Zatvori prozor',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
