import 'package:dartz/dartz.dart';
import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

class EveningazkerDatasourceRemote {
  final DioConsumer dioConsumer ;
  EveningazkerDatasourceRemote({required this.dioConsumer});

 Future<Either<EveningModel, String>> getEveningAzker({int page = 1}) async {
  try {
    final response = await dioConsumer.get(
      path: Endpoints.eveningazkarsEndpoint,
      queryParameters: {'page': page},
    );

    return response.fold(
      (error) => Right("Error: $error"),
      (res) {
        if (res.data is Map<String, dynamic>) {
          final model = EveningModel.fromJson(res.data['zekr']);
          return Left(model);
        } else {
          return Right("Invalid data format");
        }
      },
    );
  } catch (e) {
    return Right("Exception: $e");
  }
}
}
