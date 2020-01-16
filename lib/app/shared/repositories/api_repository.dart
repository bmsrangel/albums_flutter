import 'package:albums/app/shared/models/album_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class ApiRepository extends Disposable {
  Dio _client;

  ApiRepository() {
    _client = Dio();
    _client.options.baseUrl = "https://albums-node.herokuapp.com/api";
  }

  fetchAlbums() async {
    try {
      Response response = await _client.get("/albums");
      print(response.data);
      return response.data
          .map<AlbumModel>((album) => AlbumModel.fromJson(album))
          .toList();
    } on DioError catch (e) {
      throw e.message;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
