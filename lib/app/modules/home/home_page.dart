import 'package:albums/app/modules/home/custom_card/custom_card_widget.dart';
import 'package:albums/app/modules/home/home_bloc.dart';
import 'package:albums/app/modules/home/home_module.dart';
import 'package:albums/app/shared/models/album_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Albums"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeModule.to.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: StreamBuilder<List<AlbumModel>>(
        stream: bloc.outAlbums,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return CustomCardWidget(
                    album: snapshot.data[index],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
