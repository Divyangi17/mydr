import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class BasicTile {
  final String title;
  final List<BasicTile> tiles;
  final Key key;

  const BasicTile( {
    required this.title,
    this.tiles = const [],
    required this.key,
  });

}
