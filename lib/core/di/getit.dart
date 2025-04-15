import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/interceptors.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveningazker_datasource_local.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveningazker_datasource_remote.dart';
import 'package:hasna/features/eveningazker/data/repositories/evening_repositry_impli.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';
import 'package:hasna/features/eveningazker/domain/usecases/evening_usecase.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_local.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_remote.dart';
import 'package:hasna/features/morningazker/data/repositories/morning_repositry_impli.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';
import 'package:hasna/features/morningazker/domain/usecases/morninging_usecase.dart';

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
  // NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // Datasource
  sl.registerLazySingleton<EveingazkerDatasourceLocal>(
    () => EveingazkerDatasourceLocal(cache: sl()),
  );
sl.registerLazySingleton<EveningazkerDatasourceRemote>(
    () => EveningazkerDatasourceRemote(dioConsumer: sl()),
  );
   sl.registerLazySingleton<MorningazkerDatasourceLocal>(
    () => MorningazkerDatasourceLocal(cache: sl()),
  );
sl.registerLazySingleton<MorningazkerDatasourceRemote>(
    () => MorningazkerDatasourceRemote(dioConsumer: sl()),
  );
  // UseCase
   sl.registerLazySingleton(() => EveningUseCase(eveningRepositry: sl()));
     sl.registerLazySingleton(() => MorningingUsecase(morningRepositry: sl()));
  // Repository
  sl.registerLazySingleton<EveningRepositry>(
    () => EveningRepositryImpli(
       sl(),
       sl(), networkInfo: sl(),
    )
  );
    sl.registerLazySingleton<MorningRepositry>(
    () => MorningRepositryImpli(
       sl(),
       sl(), networkInfo: sl(),
    )
  );
  
  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
}