import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/prayers/data/models/prayers_model.dart';

class PrayersDatasourseLocal {
  final CacheHelper cache;
  final String keys = "Cachedtodayprayers";
  PrayersDatasourseLocal({required this.cache});

  cachePrayers(List<PrayersModel>? prayerToCache) {
    if (prayerToCache != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          prayerToCache.map((prayer)=>prayer.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<PrayersModel>> getLastPrayers() {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<PrayersModel> prayerList = decodedJson.map((jsonItem) => PrayersModel.fromJson(jsonItem)).toList();
     
      return Future.value(prayerList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
