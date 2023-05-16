import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/consts.dart';
import 'core/network/network_info.dart';
import 'features/most_popular_articals/data/datasources/local/articals_local_datasource.dart';
import 'features/most_popular_articals/data/datasources/local/articals_local_datasource_impl.dart';
import 'features/most_popular_articals/data/datasources/remote/apis/most_popular_articals_api.dart';
import 'features/most_popular_articals/data/datasources/remote/articals_remote_datasource.dart';
import 'features/most_popular_articals/data/datasources/remote/articals_remote_datasource_impl.dart';
import 'features/most_popular_articals/data/repositories/most_popular_articals_repository_impl.dart';
import 'features/most_popular_articals/domain/repositories/most_popular_articals_repository.dart';
import 'features/most_popular_articals/domain/usecases/get_most_popular_articals_usecase.dart';
import 'features/most_popular_articals/presentation/bloc/bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  setup();
  locator.registerLazySingleton<ArticalsBloc>(
      () => ArticalsBloc(getMostPopularArticalsUsecase: locator()));
}

void setup() {
  _injectNetwork();
  _injectApis();
  _injectDatasources();
  _injectRepositories();
  _injectUsecases();
  _injectEvents();
}

//Inject all network related dependencies
void _injectNetwork() {
  locator.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  )));
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(DataConnectionChecker()));
}

//Inject all repositories
void _injectRepositories() {
  locator.registerLazySingleton<MostPopularArticalsRepository>(() =>
      MostPopularArticalsRepositoryImpl(
          localDataSource: locator(),
          remoteDataSource: locator(),
          networkInfo: locator()));
}

//Inject all usecases
void _injectUsecases() {
  locator.registerLazySingleton<GetMostPopularArticalsUsecase>(
      () => GetMostPopularArticalsUsecase(locator()));
}

//Inject all Apis
void _injectApis() {
  locator.registerLazySingleton<MostPopularArticlesApi>(
      () => MostPopularArticlesApi(locator()));
}

//Inject all data sources
void _injectDatasources() {
  locator.registerLazySingleton<ArticalsLocalDataSource>(
      () => ArticalsLocalDataSourceImpl());
  locator.registerLazySingleton<ArticalsRemoteDataSource>(
      () => ArticalsRemoteDataSourceImpl(mostPopularArticlesApi: locator()));
}

//Inject all events
void _injectEvents() {
  locator.registerLazySingleton<GetMostPopularArticalsAllSections>(
      () => GetMostPopularArticalsAllSections(DEFAULT_PERIOD));
}

