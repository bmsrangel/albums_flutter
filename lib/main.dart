import 'package:flutter/material.dart';

import 'package:albums/widgets/albums.dart';

void main() async {
  runApp(MaterialApp(
    home: Albums(),
    title: "Albums",
    theme: ThemeData(primaryColor: Color.fromARGB(255, 248, 248, 248)),
  ));
}
