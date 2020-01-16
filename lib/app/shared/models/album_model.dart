import 'dart:convert';

AlbumModel albumModelFromJson(String str) =>
    AlbumModel.fromJson(json.decode(str));

String albumModelToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  String id;
  String url;
  String artist;
  String image;
  String thumbnail;
  String title;

  AlbumModel({
    this.id,
    this.url,
    this.artist,
    this.image,
    this.thumbnail,
    this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        id: json["_id"],
        url: json["url"],
        artist: json["artist"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "url": url,
        "artist": artist,
        "image": image,
        "thumbnail": thumbnail,
        "title": title,
      };
}
