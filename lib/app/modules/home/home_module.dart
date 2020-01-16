import 'package:albums/app/app_module.dart';
import 'package:albums/app/modules/home/home_bloc.dart';
import 'package:albums/app/shared/repositories/api_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:albums/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc(i.get<ApiRepository>())),
        Bind((i) => AppModule.to.get<ApiRepository>()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
