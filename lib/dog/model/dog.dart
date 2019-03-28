import 'package:flutter/foundation.dart';

class Dog {
  final int id;
  final String name;
  final String icon;
  final String originIcon;
  final String origin;
  final String overview;
  final String history;
  int isFavorite;

  Dog({
    @required this.id,
    @required this.name,
    @required this.icon,
    @required this.originIcon,
    @required this.origin,
    @required this.overview,
    @required this.history,
    @required this.isFavorite,
  })  : assert(id != null),
        assert(name != null),
        assert(icon != null),
        assert(originIcon != null),
        assert(origin != null),
        assert(overview != null),
        assert(isFavorite != null),
        assert(history != null);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['originIcon'] = originIcon;
    map['origin'] = origin;
    map['overview'] = overview;
    map['history'] = history;
    map['isFavorite'] = isFavorite;

    return map;
  }

  static Dog fromMap(Map<String, dynamic> map) => Dog(
      id: map['id'],
      history: map['history'],
      name: map['name'],
      origin: map['origin'],
      icon: map['icon'],
      originIcon: map['originIcon'],
      isFavorite: map['isFavorite'],
      overview: map['overview']);
}
