import 'package:get_it/get_it.dart';
import 'package:testbloc12/bloc/articles_cubit.dart';
import 'package:testbloc12/providers/articles_provider.dart';
import 'package:testbloc12/repositories/news_api_repository.dart';

GetIt getItInstance = GetIt.I;

class AppInjector {
  static final AppInjector _singleton = AppInjector._internal();

  factory AppInjector() => _singleton;

  AppInjector._internal();

  static void create() {
    _initCubits();
    _initRepos();
    _initNotifiers();
  }

  static _initRepos() {
    getItInstance.registerFactory(() => NewsApiRepository());

  }


  static _initCubits() {
    getItInstance.registerFactory(() => ArticlesCubit());
  }

  static void _initNotifiers() {
    getItInstance.registerLazySingleton(() => ArticlesProvider());
  }
}
