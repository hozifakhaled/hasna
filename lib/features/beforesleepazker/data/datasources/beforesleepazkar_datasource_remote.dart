import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/beforesleepazker/data/models/beforesleepazkar_model.dart';

class BeforesleepazkarDatasourceRemote {
  final DioConsumer dioConsumer;
  BeforesleepazkarDatasourceRemote({required this.dioConsumer});

  Future<List<BeforesleepazkarModel>> getBeforesleepazkar(

  ) async {
    final response = await dioConsumer.get(
      path: Endpoints.beforesleepazkersEndpoint,
    
    );
    List<BeforesleepazkarModel> beforesleepazkersList = [];
    return response.fold(
      (error) {
        throw Exception("خطأ في الاتصال: $error");
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
         for (var item in data['azkar']) {
            beforesleepazkersList.add(BeforesleepazkarModel.fromJson(item));
           
          }
           return beforesleepazkersList;
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
  }

