import 'package:flutter/material.dart';

class HarfModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<Map<String, String>> images;
  final String lekcijaIliVjezbaIndex;
  final String opis;
  final bool lekcija;
  final String imageIshodiste;
  final String videoUrl;

  const HarfModel({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.lekcijaIliVjezbaIndex,
    @required this.lekcija,
    @required this.opis,
    @required this.images,
    @required this.imageIshodiste,
    @required this.videoUrl,
  });
}
