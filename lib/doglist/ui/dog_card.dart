import 'package:flutter/material.dart';
import 'package:instazoo/dog/model/dog.dart';
import 'package:instazoo/dog/ui/dog_profile.dart';

class DogCard extends StatelessWidget {
  final Dog _dog;

  DogCard(this._dog);

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
                padding: EdgeInsets.all(16),
                child: Text(
                  _dog.overview,
                  textAlign: TextAlign.justify,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
