import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/ui/dog_profile.dart';

class Favorite extends StatefulWidget {
  final Dog _dog;

  Favorite(this._dog);

  @override
  _FavoriteState createState() => _FavoriteState(_dog);
}

// https://github.com/flutter/flutter/issues/30193
class _FavoriteState extends State<Favorite> {
  final Dog _dog;

  _FavoriteState(this._dog);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DogProfile(_dog),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Hero(
                tag: "icon${_dog.id}",
                child: Image(
                  image: NetworkImage(_dog.icon),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 0.5],
                  colors: [const Color(0xA8000000), const Color(0x00FFFFFF)],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  _dog.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
