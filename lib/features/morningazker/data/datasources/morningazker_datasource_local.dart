import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

class MorningazkerDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedMorningAzker";
  
  MorningazkerDatasourceLocal({required this.cache});

  void cacheMorningzaker(MorningModel? morningToCache, String key) {
    if (morningToCache != null) {
      cache.saveData(
        key: keys + key,
        value: json.encode(morningToCache.toJson()),
      );
    } else {
      throw CacheExeption(errorMessage: "No data to cache.");
    }
  }

  Future<MorningModel?> getLastMorningingZaker(String key) async {
    final jsonString = cache.getDataString(key: keys + key);

    if (jsonString != null) {
      return Future.value(MorningModel.fromJson(json.decode(jsonString)));
    } else {
      return null;  // Returning null instead of throwing an exception
    }
  }
}

