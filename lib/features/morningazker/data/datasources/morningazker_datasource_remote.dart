import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/core/errors/error_model.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

class MorningazkerDatasourceRemote {
  final DioConsumer dioConsumer;

  MorningazkerDatasourceRemote({required this.dioConsumer});

  Future<List<MorningModel>> getMorningAzker() async {
    final either = await dioConsumer.get(path: Endpoints.morningazkarsEndpoint);

    return either.fold(
      (error) {
        throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return MorningModel.fromJsonList(data);
        } else {
          throw ServerException(
              ErrorModel(errorMessage: "Invalid data format", status: 500));
        }
      },
    );
  }
}
