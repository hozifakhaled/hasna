import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/core/errors/error_model.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/features/prayerstimers/data/models/prayers_timers_model.dart';

class PrayersTimersDatasourceRemote {
  final DioConsumer dioConsumer;

  PrayersTimersDatasourceRemote({required this.dioConsumer});

  Future<PrayersTimersModel> getPrayersTimers() async {
    final either = await dioConsumer.get(path: Endpoints.prayerstimersEndpoint);

    return either.fold(
      (error) {
        throw ServerException(ErrorModel(
            status: 500, errorMessage: "خطأ في الاتصال: $error"));
      },
      (response) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return PrayersTimersModel.fromJson(data);
        } else {
          throw ServerException(
              ErrorModel(errorMessage: "Invalid data format", status: 500));
        }
      },
    );
  }
}

