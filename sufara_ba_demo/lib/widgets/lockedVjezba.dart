import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

Widget lockedVjezba(BuildContext context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kon_boja, Colors.transparent],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
                Positioned(
          child: Icon(Icons.lock_outline, color: Colors.white,),
          right: 5,
          top: 5,
        ),
      ],
    ),
  );
}
