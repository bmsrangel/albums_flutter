import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title, artist, imgUrl;

  CardHeader(this.title, this.artist, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 60),
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[200]))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(fontSize: 19, color: Colors.grey[700])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(artist, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
