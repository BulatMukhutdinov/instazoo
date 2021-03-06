import 'dart:io';

import 'package:instazoo/dog/model/dog.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final _databaseName = "instazoo.db";
  static final _databaseVersion = 1;

  static final _table = 'dog';

  static final _columnId = 'id';
  static final _columnIcon = 'icon';
  static final _columnOriginIcon = 'originIcon';
  static final _columnName = 'name';
  static final _columnOrigin = 'origin';
  static final columnOverview = 'overview';
  static final columnHistory = 'history';
  static final columnIsFavorite = 'isFavorite';

  // make this a singleton class
  DbHelper._();

  static final DbHelper instance = DbHelper._();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_table (
            $_columnId INTEGER PRIMARY KEY,
            $_columnIcon TEXT NOT NULL,
            $_columnOriginIcon TEXT NOT NULL,
            $_columnName TEXT NOT NULL,
            $_columnOrigin TEXT NOT NULL,
            $columnOverview TEXT NOT NULL,
            $columnHistory TEXT NOT NULL,
            $columnIsFavorite BOOLEAN NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Dog dog) async {
    Database db = await instance.database;
    return await db.insert(_table, dog.toMap());
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Dog>> queryAllRows() async {
    Database db = await instance.database;
    var rows = await db.query(_table);
    var dogs = rows.expand((row) => [Dog.fromMap(row)]).toList();

    return dogs;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $_table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Dog dog) async {
    Database db = await instance.database;
    var row = dog.toMap();
    int id = row[_columnId];
    return await db
        .update(_table, row, where: '$_columnId = ?', whereArgs: [id]);
  }

  // Get all the rows where criteria is met
  Future<List<Dog>> where(Map<String, dynamic> criteria) async {
    Database db = await instance.database;
    String delimiter = "AND ";
    String where = "";
    criteria.forEach((key, value) {
      where += "$key = $value $delimiter";
    });

    if (where.isNotEmpty) {
      where = where.substring(0, where.length - delimiter.length);
    }

    List<Map<String, dynamic>> dogsRaw = await db.query(_table, where: where);

    var result = <Dog>[];

    dogsRaw.forEach((raw) {
      result.add(Dog.fromMap(raw));
    });

    return result;
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_table, where: '$_columnId = ?', whereArgs: [id]);
  }
}
