import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';

class DogProfile extends StatelessWidget {
  final Dog _dog;

  const DogProfile(this._dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dog.name),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: "icon${_dog.id}",
              child: AspectRatio(
                aspectRatio: 1 / .6,
                child: Image.network(
                  _dog.icon,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                _dog.history,
                textAlign: TextAlign.justify,
                textScaleFactor: 1.3,
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
