import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

class EveningazkerDatasourceRemote {
  final DioConsumer dioConsumer;
  EveningazkerDatasourceRemote({required this.dioConsumer});

  Future<EveningModel> getEveningAzker({
    required int page,
  }) async {
    final response = await dioConsumer.get(
      path: Endpoints.eveningazkarsEndpoint,
      queryParameters: {'page': page},
    );
    return response.fold(
      (error) {
        throw Exception("خطأ في الاتصال: $error");
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return EveningModel.fromJson(data);
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
  }

