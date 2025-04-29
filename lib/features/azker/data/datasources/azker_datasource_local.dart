import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/azker/data/models/azkar_model.dart';

class AzkerDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedEAzker";
  AzkerDatasourceLocal({required this.cache});

  cacheAzaker(List<AzkerModel>? azkerToCache, String key) {
    if (azkerToCache != null) {
      cache.saveData(
        key:keys+key,
        value: json.encode(
          azkerToCache.map((zaker)=>zaker.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<AzkerModel>> getLastZaker(String key) {
    final jsonString = cache.getDataString(key:keys+key);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<AzkerModel> zakerList = decodedJson.map((jsonItem) => AzkerModel.fromJson(jsonItem)).toList();
     
      return Future.value(zakerList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

