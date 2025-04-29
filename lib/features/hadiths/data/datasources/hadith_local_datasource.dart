import 'dart:convert';

import 'package:hasna/features/hadiths/data/models/hadith_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HadithLocalDatasource {
  Future<void> cacheHadiths(HadithModel hadithsToCache);
  Future<HadithModel> getLastHadith();
}

class HadithLocalDatasourceImpl implements HadithLocalDatasource {
  final SharedPreferences sharedPreferences;
  HadithLocalDatasourceImpl({required this.sharedPreferences});

  // في دالة cacheHadiths
@override
  Future<void> cacheHadiths(HadithModel hadithsToCache) async {
  print("Caching hadith: ${hadithsToCache.toJson()}");
  await sharedPreferences.setString('cached_hadith', json.encode(hadithsToCache.toJson()));
  print("Hadith cached successfully");
}

// في دالة getLastHadith
@override
Future<HadithModel> getLastHadith() async {
  try {
    final jsonString = sharedPreferences.getString('cached_hadith');
    if (jsonString != null && jsonString.isNotEmpty) {
      final decodedJson = json.decode(jsonString);
      return HadithModel.fromJson(decodedJson);
    } else {
      throw Exception("لا توجد بيانات مخزنة");
    }
  } catch (e) {
    print("خطأ في استرجاع البيانات المحلية: $e");
    throw Exception("خطأ في استرجاع البيانات المحلية: $e");
  }
}

 
  }