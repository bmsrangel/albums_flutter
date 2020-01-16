import 'package:albums/app/shared/models/album_model.dart';
import 'package:albums/app/shared/repositories/api_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Disposable {
  final ApiRepository api;

  HomeBloc(this.api) {
    getAlbums();
  }

  BehaviorSubject<List<AlbumModel>> albums$ =
      BehaviorSubject<List<AlbumModel>>();
  Sink<List<AlbumModel>> get inAlbums => albums$.sink;
  Stream<List<AlbumModel>> get outAlbums => albums$.stream;

  Future<void> getAlbums() async {
    try {
      List<AlbumModel> albums = await api.fetchAlbums();
      inAlbums.add(albums);
    } catch (e) {
      albums$.addError(e);
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    albums$.close();
  }
}
