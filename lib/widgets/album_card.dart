import 'package:albums/widgets/card_header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumCard extends StatefulWidget {
  final Map<String, dynamic> data;
  AlbumCard(this.data);
  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    String title = widget.data["title"];
    String artist = widget.data["artist"];
    String imgUrl = widget.data["thumbnail"];
    String image = widget.data["image"];
    String url = widget.data["url"];
    return Container(
      margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      height: 510,
      width: 400,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200]),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey[300], offset: Offset(0.5, 0.5))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CardHeader(title, artist, imgUrl),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: Image.network(
              image,
              alignment: Alignment.topCenter,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: OutlineButton(
              onPressed: () {
                _launchUrl(url);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "Comprar",
                style: TextStyle(fontSize: 16),
              ),
              color: Colors.white,
              textColor: Color.fromARGB(255, 67, 146, 249),
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 67, 146, 249), style: BorderStyle.solid),
            ),
          )
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    }
  }
}
