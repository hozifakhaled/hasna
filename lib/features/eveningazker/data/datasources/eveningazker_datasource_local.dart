import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

class EveingazkerDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedEveningAzker";
  EveingazkerDatasourceLocal({required this.cache});

  cacheEveningzaker(EveningModel? eveningToCache,String key) {
    if (eveningToCache != null) {
      cache.saveData(
        key:keys+ key,
        value: json.encode(
          eveningToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<EveningModel> getLastEveningZaker(String key) {
    final jsonString = cache.getDataString(key:keys+ key);

    if (jsonString != null) {
      return Future.value(EveningModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

