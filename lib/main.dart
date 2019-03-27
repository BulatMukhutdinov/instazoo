import 'package:flutter/material.dart';
import 'package:instazoo/dog/repo/dog_repository.dart';
import 'package:instazoo/doglist/ui/dog_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App() {
    loadIfNeeded();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        top: false,
        child: DogList(),
      ),
    );
  }
}
