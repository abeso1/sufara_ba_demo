import 'package:flutter/material.dart';
import 'package:sufara_ba_demo/shared/constants.dart';

Widget lockedVjezba(BuildContext context) {
  return Opacity(
    opacity: 0.2,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [grey_color, Colors.transparent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            child: Icon(
              Icons.lock_outline,
              color: Colors.black,
            ),
            right: 5,
            top: 5,
          ),
        ],
      ),
    ),
  );
}
