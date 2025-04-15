import 'package:dartz/dartz.dart';
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
    return EveningModel.fromJson(response);
  }
}
