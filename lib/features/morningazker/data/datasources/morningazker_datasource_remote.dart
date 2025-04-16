import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

class MorningazkerDatasourceRemote {
  final DioConsumer dioConsumer;
  MorningazkerDatasourceRemote({required this.dioConsumer});

  Future<MorningModel> getMorningAzker({
    required int page,
  }) async {
    final either = await dioConsumer.get(
      path: Endpoints.morningazkarsEndpoint,
      queryParameters: {'page': page},
    );

    // تفكيك Either
    return either.fold(
      (error) {
        throw Exception("خطأ في الاتصال: $error");
      },
      (response) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return MorningModel.fromJson(data);
        } else {
          throw Exception("شكل البيانات غير صحيح");
        }
      },
    );
  }
}
