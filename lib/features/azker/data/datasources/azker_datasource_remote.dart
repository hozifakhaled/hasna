import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/errors/error_model.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/azker/data/models/azkar_model.dart';

class AzkerDatasourceRemote {
  final DioConsumer dioConsumer;
  AzkerDatasourceRemote({required this.dioConsumer});

  Future<List<AzkerModel>> getAzker(
String endpoint
  ) async {
    final response = await dioConsumer.get(
      path: endpoint,
    
    );
    List<AzkerModel>azkarList = [];
    return response.fold(
      (error) {
         throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
         for (var item in data['azkar']) {
            azkarList.add(AzkerModel.fromJson(item));
           
          }
           return azkarList;
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
  }

