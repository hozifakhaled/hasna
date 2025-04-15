import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

class MorningazkerDatasourceRemote {
  final DioConsumer dioConsumer;
  MorningazkerDatasourceRemote({required this.dioConsumer});

  Future<MorningModel> getMorningAzker({
    required int page,
  }) async {
    final response = await dioConsumer.get(
      path: Endpoints.eveningazkarsEndpoint,
      queryParameters: {'page': page},
    );
    return MorningModel.fromJson(response);
  }
}
