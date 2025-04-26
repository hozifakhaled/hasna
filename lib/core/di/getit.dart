import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/interceptors.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/features/beforesleepazker/data/datasources/beforesleepazkar_datasource_local.dart';
import 'package:hasna/features/beforesleepazker/data/datasources/beforesleepazkar_datasource_remote.dart';
import 'package:hasna/features/beforesleepazker/data/repositories/beforesleepazkar_repositry_impli.dart';
import 'package:hasna/features/beforesleepazker/domain/repositories/beforesleepazkar_repositry.dart';
import 'package:hasna/features/beforesleepazker/domain/usecases/beforesleepazkar_usecase.dart';
import 'package:hasna/features/beforesleepazker/presentation/cubit/beforesleepazkar_cubit.dart';
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
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_local.dart';
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_remote.dart';
import 'package:hasna/features/prayerstimers/data/repositories/prayers_timers_repositry_Impl.dart';
import 'package:hasna/features/prayerstimers/domain/repositories/prayers_timers_repositry.dart';
import 'package:hasna/features/prayerstimers/domain/usecases/prayers_timers_usecase.dart';
import 'package:hasna/features/prayerstimers/presentation/cubit/prayerstimers_cubit.dart';

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
    sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
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

    sl.registerLazySingleton<PrayersTimersDatasourceRemote>(
    () => PrayersTimersDatasourceRemote(dioConsumer: sl()),
  );
  sl.registerLazySingleton<PrayersTimersDatasourceLocal>(
    () => PrayersTimersDatasourceLocal(cache: sl()),
  );


  sl.registerLazySingleton<MorningazkerDatasourceRemote>(
    () => MorningazkerDatasourceRemote(dioConsumer: sl()),
  );
    sl.registerLazySingleton<BeforesleepazkarDatasourceRemote>(
    () => BeforesleepazkarDatasourceRemote(dioConsumer: sl()),
  );
    sl.registerLazySingleton<BeforesleepazkarDatasourceLocal>(
    () => BeforesleepazkarDatasourceLocal(cache: sl()),
  );
  // UseCase
   sl.registerLazySingleton(() => BeforesleepazkarUseCase(beforesleepazkarRepositry: sl()));
  sl.registerLazySingleton(() => EveningUseCase(eveningRepositry: sl()));
  sl.registerLazySingleton(() => MorningingUsecase(morningRepositry: sl()));
  sl.registerLazySingleton(() => PrayersTimersUsecase(prayersTimersRepositry: sl()));
    // Repository
  sl.registerLazySingleton<EveningRepositry>(
    () => EveningRepositryImpli(sl(), sl(), networkInfo: sl()),
  );
 
   sl.registerLazySingleton<PrayersTimersRepositry>(
    () => PrayersTimersRepositryImpl(sl(), sl(), networkInfo: sl()),
  );


  sl.registerLazySingleton<BeforesleepazkarRepositry>(
    () => BeforesleepazkarRepositryImpli(sl(), sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MorningRepositry>(
    () => MorningRepositryImpli(sl(), sl(), networkInfo: sl()),
  );

  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
  //cubit
  sl.registerLazySingleton(() => EveningazkerCubit(sl()));

sl.registerLazySingleton(() => MorningazkerCubit(sl() ,0));

sl.registerLazySingleton(() => BeforesleepazkarCubit(sl()));
sl.registerLazySingleton(() => PrayerstimersCubit(sl()));
}
