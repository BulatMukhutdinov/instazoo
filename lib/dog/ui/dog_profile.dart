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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.attach_money),
            tooltip: 'Buy',
            onPressed: () => showDialog(
                context: context,
                builder: (context) => _buyDialogBuilder(context)),
          ),
        ],
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

  Widget _buyDialogBuilder(BuildContext context) {
    return SimpleDialog(
      title: Text("Be patient"),
      children: [
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    "This function not ready yet",
                    style: Theme.of(context).textTheme.body1,
                    textScaleFactor: 1.1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Align(
                  alignment: Alignment(1, 0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
