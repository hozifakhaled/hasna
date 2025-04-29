import 'package:hasna/core/databases/api/dio_consumer.dart';
import 'package:hasna/core/databases/api/endpoints.dart';
import 'package:hasna/features/hadiths/data/models/hadith_model.dart';

class HadithRemoteDatasource {
  final DioConsumer dioConsumer;
  HadithRemoteDatasource({required this.dioConsumer});
  Future<HadithModel> getHadith() async {
  try {
    final response = await dioConsumer.get(path: Endpoints.hadithEndpoint);
    return response.fold(
      (error) => throw Exception("Error fetching hadith: $error"),
      (hadith) => HadithModel.fromJson(hadith.data), 
    );
  } catch (e) {
    throw Exception("Error fetching hadith: $e");
  }
}
}