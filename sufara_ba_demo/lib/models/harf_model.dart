import 'package:flutter/material.dart';

class HarfModel {
  final String id;
  final String name;
  final String imageUrl;
  final String lekcijaIliVjezbaIndex;
  final String opis;
  final bool lekcija;

  const HarfModel({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.lekcijaIliVjezbaIndex,
    @required this.lekcija,
    @required this.opis,
  });
}
