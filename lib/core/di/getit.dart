import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/interceptors.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/features/azker/data/datasources/azker_datasource_local.dart';
import 'package:hasna/features/azker/data/datasources/azker_datasource_remote.dart';
import 'package:hasna/features/azker/data/repositories/azkar_repositry_impli.dart';
import 'package:hasna/features/azker/domain/repositories/azkar_repositry.dart';
import 'package:hasna/features/azker/domain/usecases/azkar_usecase.dart';
import 'package:hasna/features/azker/presentation/cubit/azker_cubit.dart';
import 'package:hasna/features/hadiths/data/datasources/hadith_local_datasource.dart';
import 'package:hasna/features/hadiths/data/datasources/hadith_remote_datasource.dart';
import 'package:hasna/features/hadiths/data/repositories/hadith_repositry_Impl.dart';
import 'package:hasna/features/hadiths/domain/repositories/hadith_repositry.dart';
import 'package:hasna/features/hadiths/domain/usecases/hadith_usecase.dart';
import 'package:hasna/features/hadiths/presentation/cubit/hadiths_cubit.dart';
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

   sl.registerLazySingleton(() => PrayersTimersUsecase(prayersTimersRepositry: sl()));
  sl.registerLazySingleton(() => HadithUsecase( sl()));
    sl.registerLazySingleton(() => AzkarUsecase(repositry: sl()));
      sl.registerLazySingleton(() => PrayersUsecase(repositry: sl()));
    // Repository


  sl.registerLazySingleton<PrayersTimersRepositry>(
    () => PrayersTimersRepositryImpl(sl(), sl(), networkInfo: sl()),
  );

  
  sl.registerLazySingleton<PrayerRepositry>(
    () => PrayersRepositryImpli(local: sl(), remote: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<AzkarRepositry>(
    () => AzkerRepositryImpli(sl(), sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<HadithRepositry>(
    () => HadithRepositryImpl( hadithRemoteDataSource: sl(), hadithLocalDataSource: sl(), networkInfo: sl()),
  );

  // CacheHelper
  sl.registerLazySingleton(() => CacheHelper());
  //cubit
  sl.registerLazySingleton(() => AzkerCubit(sl()));
  sl.registerFactory(() => HadithsCubit(sl()));
  

  sl.registerFactory(() => PrayersCubit(sl()));

sl.registerFactory(() => PrayerstimersCubit(sl()));
}
