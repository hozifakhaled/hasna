import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/core/errors/error_model.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

class EveningazkerDatasourceRemote {
  final DioConsumer dioConsumer;
  EveningazkerDatasourceRemote({required this.dioConsumer});

  Future<List<EveningModel>> getEveningAzker(

  ) async {
    final response = await dioConsumer.get(
      path: Endpoints.eveningazkarsEndpoint,
    
    );
    List<EveningModel> eveningAzkarList = [];
    return response.fold(
      (error) {
         throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
         for (var item in data['azkar']) {
            eveningAzkarList.add(EveningModel.fromJson(item));
           
          }
           return eveningAzkarList;
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
  }

