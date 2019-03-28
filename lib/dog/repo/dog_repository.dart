import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/repo/db_helper.dart';

void loadIfNeeded() {
  DbHelper.instance.queryAllRows().then((dogs) {
    if (dogs.isEmpty) {
      _loadDogs().then((dogs) {
        dogs.forEach((dog) => DbHelper.instance.insert(dog));
      });
    }
  });
}

Future<List<Dog>> _loadDogs() async {
  String dogsRaw = await rootBundle.loadString('assets/data/dogs.json');
  return _parseJsonForCrossword(dogsRaw);
}

List<Dog> _parseJsonForCrossword(String jsonString) {
  final dogs = <Dog>[];

  List decoded = jsonDecode(jsonString);

  decoded.forEach((raw) {
    if (raw is Map) {
      dogs.add(Dog(
          id: raw['id'],
          originIcon: raw['originIcon'],
          icon: raw['icon'],
          origin: raw['origin'],
          name: raw['name'],
          history: raw['history'],
          isFavorite: raw['isFavorite'],
          overview: raw['overview']));
    }
  });
  return dogs;
}
