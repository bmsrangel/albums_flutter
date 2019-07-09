import 'package:flutter/material.dart';
import 'package:albums/widgets/album_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Albums",
            style: TextStyle(color: Colors.grey[600], fontSize: 24),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      strokeWidth: 5,
                    ),
                  ),
                );
                break;
              default:
                if (snapshot.hasError) {
                  return Container();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return AlbumCard(snapshot.data[index]);
                    },
                  );
                }
            }
          },
        ));
  }

  Future<List> _getData() async {
    http.Response response;
    String url = 'https://albums-node.herokuapp.com/api/albums';
    response = await http.get(url);
    return json.decode(response.body);
  }
}
