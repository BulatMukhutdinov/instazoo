import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/repo/db_helper.dart';
import 'package:instazoo/doglist/ui/dog_card.dart';

class DogList extends StatefulWidget {
  @override
  _DogListState createState() => _DogListState();
}

class _DogListState extends State<DogList> {
  Future<List<Dog>> _dogs;

  _DogListState() {
    _dogs = _getDogsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insta Zoo"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      body: RefreshIndicator(
        child: FutureBuilder(
          future: _dogs,
          builder: (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
            if (snapshot.hasData) {
              return _buildList(context, snapshot.data);
            }
          },
        ),
        onRefresh: () {
          setState(() {
            _dogs = DbHelper.instance.queryAllRows();
          });
          return _dogs;
        },
      ),
    );
  }

  Future<List<Dog>> _getDogsList() => DbHelper.instance.queryAllRows();

  Widget _buildList(BuildContext context, List<Dog> dogs) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: dogs.length,
        itemBuilder: (_, int index) => DogCard(dogs[index]),
      );
    } else {
      return GridView.builder(
        itemCount: dogs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) => DogCard(dogs[index]),
      );
    }
  }
}
