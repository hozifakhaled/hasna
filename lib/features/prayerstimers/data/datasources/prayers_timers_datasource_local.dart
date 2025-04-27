import 'dart:convert';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/prayerstimers/data/models/prayers_timers_model.dart';

class PrayersTimersDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedPrayerstimers";
  
  PrayersTimersDatasourceLocal({required this.cache});

  void cachePrayerstimers(PrayersTimersModel? prayerstimersToCache) {
    if (prayerstimersToCache != null) {
      cache.saveData(
        key: keys ,
        value: json.encode(prayerstimersToCache.toJson()),
      );
    } else {
      throw CacheExeption(errorMessage: "No data to cache.");
    }
  }

  Future<PrayersTimersModel?> getLastPrayerstimers() async {
    final jsonString = cache.getDataString(key: keys );

    if (jsonString != null) {
      return Future.value(PrayersTimersModel.fromJson(json.decode(jsonString)));
    } else {
      return null;  // Returning null instead of throwing an exception
    }
  }
}

