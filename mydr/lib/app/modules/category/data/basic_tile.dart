
import 'package:flutter/cupertino.dart';

import '../model/basic_tile.dart';

final basicTiles = <BasicTile>[
  // BasicTile(title: 'Countries', tiles: [
  //   BasicTile(title: 'Russia', key: const Key('Russia1')),
  //   BasicTile(title: 'Canada', key: const Key('Canada1')),
  //   BasicTile(title: 'USA', key: const Key('USA1')),
  //   BasicTile(title: 'China', key: const Key('China1')),
  //   BasicTile(title: 'China', key: const Key('China1')),
  //   BasicTile(title: 'Australia', key: const Key('Australia1')),
  //   BasicTile(title: 'India', key: const Key('India1')),
  //   BasicTile(title: 'Argentina', key: const Key('Argentina1')),
  // ], key: const Key('country1')),
  BasicTile(title: 'Dates', tiles: [
    BasicTile(title: '2020', tiles: buildMonths(), key: const Key('2020_1')),
    BasicTile(title: '2021', tiles: buildMonths(), key: const Key('2020_2')),
    const BasicTile(title: '2022', key: const Key('2022_1')),
    const BasicTile(title: '2023', key: const Key('2023_1')),
  ], key: const Key('dates1')),
];

class Months {
  final String title;
  final Key key;

  const Months( {
    required this.title,
    required this.key,
  });

}

List<BasicTile> buildMonths() => [
  Months(title: 'January',key: const Key('Jan')),
  Months(title: 'February',key: const Key('Feb')),
  Months(title: 'March',key: const Key('Mar')),
  Months(title: 'April',key: const Key('Apr')),
  Months(title: 'November',key: const Key('Nov')),
  Months(title: 'December',key: const Key('Dec')),
].map<BasicTile>(buildMonth).toList();

BasicTile buildMonth(Months month) => BasicTile(
    title: month.title,
    tiles: List.generate(28, (index)  { var i=1; return BasicTile(title: '$index.', key: Key("$index"));}),
    key: month.key);
