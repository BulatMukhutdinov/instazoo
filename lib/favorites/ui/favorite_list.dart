import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/repo/db_helper.dart';
import 'package:instazoo/favorites/ui/favorite.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  Future<List<Dog>> _favorites;

  _FavoriteListState() {
    _favorites = _getFavorites();
  }

  Future<List<Dog>> _getFavorites() =>
      DbHelper.instance.where({"isFavorite": 1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      body: FutureBuilder(
        future: _favorites,
        builder: (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
          if (snapshot.hasData) {
            return _buildList(context, snapshot.data);
          } else {
            return _buildList(context, []);
          }
        },
      ),
    );
  }

  Widget _buildList(BuildContext context, List list) {
    return GridView.builder(
      itemCount: list.length,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemBuilder: (_, int index) => Favorite(list[index]),
    );
  }
}
