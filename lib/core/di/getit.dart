import 'package:data_connection_checker_tv/data_connection_checker.dart';
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
import 'package:hasna/features/eveningazker/presentation/cubit/eveningazker_cubit.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_local.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_remote.dart';
import 'package:hasna/features/morningazker/data/repositories/morning_repositry_impli.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';
import 'package:hasna/features/morningazker/domain/usecases/morninging_usecase.dart';
import 'package:hasna/features/morningazker/presentation/cubit/morningazker_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  // ✅ تسجيل CacheHelper وتهيئة SharedPreferences
  sl.registerLazySingleton(() => CacheHelper());
  await sl<CacheHelper>().init();

  // ✅ تسجيل DataConnectionChecker
  sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());

  // ✅ تسجيل Interceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // ✅ تسجيل DioConsumer مع Interceptor
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });

  // ✅ تسجيل NetworkInfoImpl باستخدام DataConnectionChecker
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // ✅ تسجيل DataSources
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

  // ✅ تسجيل UseCases
  sl.registerLazySingleton(() => EveningUseCase(eveningRepositry: sl()));
  sl.registerLazySingleton(() => MorningingUsecase(morningRepositry: sl()));

  // ✅ تسجيل Repositories
  sl.registerLazySingleton<EveningRepositry>(
    () => EveningRepositryImpli(sl(), sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MorningRepositry>(
    () => MorningRepositryImpli(sl(), sl(), networkInfo: sl()),
  );
  
  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
}
