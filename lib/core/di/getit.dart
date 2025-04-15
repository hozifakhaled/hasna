import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/interceptors.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveingazker_datasource_local.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveningazker_datasource_remote.dart';
import 'package:hasna/features/eveningazker/domain/usecases/evening_usecase.dart';

final sl = GetIt.instance;



void setup() {
  // Interceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // Dio + LoggerInterceptor
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });

  // Datasource
  sl.registerLazySingleton<EveingazkerDatasourceLocal>(
    () => EveingazkerDatasourceLocal(cache: sl()),
  );

  // UseCase
   sl.registerLazySingleton(() => EveningUseCase(eveningRepositry: sl()));
  // Repository
  
  sl.registerLazySingleton<EveningazkerDatasourceRemote>(
    () => EveningazkerDatasourceRemote(dioConsumer: sl()),
  );
  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
}