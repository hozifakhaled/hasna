import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/prayers/data/models/prayers_model.dart';

class PrayersDatasourceRemote {
  final DioConsumer dioConsumer;
  PrayersDatasourceRemote({required this.dioConsumer});

  Future<List<PrayersModel>> getPrayers() async {
    final response = await dioConsumer.get(path: Endpoints.prayersEndpoint);
    List<PrayersModel> prayersList = [];
    return response.fold(
      (error) {
        throw Exception("خطأ في الاتصال: $error");
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          for (var item in data['azkar']) {
            prayersList.add(PrayersModel.fromJson(item));
          }
          return prayersList;
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
}
