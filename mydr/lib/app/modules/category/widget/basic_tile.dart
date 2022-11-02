import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/basic_tile.dart';

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    required Key key,
    required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.tiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          children: tiles.map((tile) => BasicTileWidget(tile: tile, key: tile.key,)).toList(),
        ),
      );
    }
  }
}