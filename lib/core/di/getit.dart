import 'package:connectivity_plus/connectivity_plus.dart';
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
import 'package:hasna/features/prayers/data/datasources/prayers_datasource_remote.dart';
import 'package:hasna/features/prayers/data/datasources/prayers_datasourse_local.dart';
import 'package:hasna/features/prayers/data/repositories/prayers_repositry_impli.dart';
import 'package:hasna/features/prayers/domain/repositories/prayer_repositry.dart';
import 'package:hasna/features/prayers/domain/usecases/prayers_usecase.dart';
import 'package:hasna/features/prayers/presentation/cubit/prayers_cubit.dart';
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_local.dart';
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_remote.dart';
import 'package:hasna/features/prayerstimers/data/repositories/prayers_timers_repositry_impl.dart';
import 'package:hasna/features/prayerstimers/domain/repositories/prayers_timers_repositry.dart';
import 'package:hasna/features/prayerstimers/domain/usecases/prayers_timers_usecase.dart';
import 'package:hasna/features/prayerstimers/presentation/cubit/prayerstimers_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void setup() async {

    final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  // Interceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // Dio + LoggerInterceptor
  sl.registerLazySingleton(() {
    final dio = Dio();
    dio.interceptors.add(sl<LoggerInterceptor>());
    return DioConsumer(dio: dio);
  });
  // NetworkInfo
  sl.registerLazySingleton<DataConnectionChecker>(
    () => DataConnectionChecker(),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
   sl.registerLazySingleton(() => Connectivity());
  // Datasource
  sl.registerLazySingleton<AzkerDatasourceLocal>(
    () => AzkerDatasourceLocal(cache: sl()),
  );
  sl.registerLazySingleton<AzkerDatasourceRemote>(
    () => AzkerDatasourceRemote(dioConsumer: sl()),
  );
 

  sl.registerLazySingleton<PrayersTimersDatasourceRemote>(
    () => PrayersTimersDatasourceRemote(dioConsumer: sl()),
  );
  sl.registerLazySingleton<PrayersTimersDatasourceLocal>(
    () => PrayersTimersDatasourceLocal(cache: sl()),
  );
  sl.registerLazySingleton<HadithRemoteDatasource>(
    () => HadithRemoteDatasource(dioConsumer: sl()),
  );
  

  sl.registerLazySingleton<HadithLocalDatasource>(
    () => HadithLocalDatasourceImpl(sharedPreferences: sl()),
  );

 

  sl.registerLazySingleton<PrayersDatasourceRemote>(
    () => PrayersDatasourceRemote(dioConsumer: sl()),
  );
  sl.registerLazySingleton<PrayersDatasourseLocal>(
    () => PrayersDatasourseLocal(cache: sl()),
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

  
  sl.registerLazySingleton<PrayerRepositry>(
    () => PrayersRepositryImpli(local: sl(), remote: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<HadithRepositry>(
    () => HadithRepositryImpl( hadithRemoteDataSource: sl(), hadithLocalDataSource: sl(), networkInfo: sl()),
  );

  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
  //cubit
  sl.registerLazySingleton(() => AzkerCubit(sl()));

  

  sl.registerFactory(() => PrayersCubit(sl()));

sl.registerLazySingleton(() => BeforesleepazkarCubit(sl()));
sl.registerFactory(() => PrayerstimersCubit(sl()));
}
