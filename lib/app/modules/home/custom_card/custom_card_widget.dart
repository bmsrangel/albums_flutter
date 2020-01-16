import 'package:albums/app/shared/models/album_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final AlbumModel album;

  const CustomCardWidget({Key key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  child: CachedNetworkImage(
                    imageUrl: album.thumbnail,
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      album.title,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      album.artist,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              width: 330,
              height: 330,
              imageUrl: album.image,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: OutlineButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                "Comprar",
                style: TextStyle(fontSize: 16),
              ),
              color: Colors.white,
              textColor: Color.fromARGB(255, 67, 146, 249),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 67, 146, 249),
                  style: BorderStyle.solid),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
