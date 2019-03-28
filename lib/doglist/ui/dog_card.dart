import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/repo/db_helper.dart';
import 'package:instazoo/dog/ui/dog_profile.dart';

class DogCard extends StatefulWidget {
  final Dog _dog;

  DogCard(this._dog);

  @override
  _DogCardState createState() => _DogCardState(_dog);
}

class _DogCardState extends State<DogCard> {
  Dog _dog;

  _DogCardState(this._dog);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Click to show details",
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DogProfile(_dog),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_dog.originIcon),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 16),
                        child: Text(
                          _dog.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Origin: ${_dog.origin}",
                          maxLines: 1,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Hero(
                tag: "icon${_dog.id}",
                child: AspectRatio(
                  aspectRatio: 2 / 1,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.jpg',
                    image: _dog.icon,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  _dog.overview,
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: _dog.isFavorite == 1
                      ? Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    _dog.isFavorite = -_dog.isFavorite;
                    DbHelper.instance.update(_dog);
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
