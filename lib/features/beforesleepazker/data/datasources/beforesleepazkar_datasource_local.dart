import 'dart:convert';

import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/beforesleepazker/data/models/beforesleepazkar_model.dart';
class BeforesleepazkarDatasourceLocal {
  final CacheHelper cache;
  final String keys = "CachedBeforesleepazkar";
  BeforesleepazkarDatasourceLocal({required this.cache});

  cacheBeforesleepazkar(List<BeforesleepazkarModel>? beforesleepazkarToCache) {
    if (beforesleepazkarToCache != null) {
      cache.saveData(
        key:keys,
        value: json.encode(
          beforesleepazkarToCache.map((zaker)=>zaker.toJson()).toList(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<BeforesleepazkarModel>> getLastBeforesleepazkar() {
    final jsonString = cache.getDataString(key:keys);

    if (jsonString != null) {
  final List<dynamic> decodedJson = json.decode(jsonString);
    final List<BeforesleepazkarModel> eveningList = decodedJson.map((jsonItem) => BeforesleepazkarModel.fromJson(jsonItem)).toList();
     
      return Future.value(eveningList);
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}

