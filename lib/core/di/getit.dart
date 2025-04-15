import 'package:get_it/get_it.dart';
import 'package:hasna/core/databases/api/interceptors.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';

final sl = GetIt.instance;



void setup() {
  // ---------------------------
  // Network Dependencies
  // ---------------------------

  // ✅ تسجيل LoggerInterceptor
  sl.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());
  sl.registerLazySingleton(() => CacheHelper());
}
