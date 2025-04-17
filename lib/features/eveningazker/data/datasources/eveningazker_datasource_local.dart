import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

class EveingazkerDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedEveningAzker";
  EveingazkerDatasourceLocal({required this.cache});

  cacheEveningzaker(List<EveningModel>? eveningToCache) {
    if (eveningToCache != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          eveningToCache.map((zaker)=>zaker.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<EveningModel>> getLastEveningZaker() {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<EveningModel> eveningList = decodedJson.map((jsonItem) => EveningModel.fromJson(jsonItem)).toList();
     
      return Future.value(eveningList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

