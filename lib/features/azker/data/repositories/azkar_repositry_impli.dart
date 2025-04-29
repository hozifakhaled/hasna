import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/azker/data/datasources/azker_datasource_local.dart';
import 'package:hasna/features/azker/data/datasources/azker_datasource_remote.dart';
import 'package:hasna/features/azker/data/models/azkar_model.dart';
import 'package:hasna/features/azker/domain/repositories/azkar_repositry.dart';

class AzkerRepositryImpli implements AzkarRepositry {
  final NetworkInfo networkInfo;
  final AzkerDatasourceRemote remote;
  final AzkerDatasourceLocal local;

  AzkerRepositryImpli(this.remote, this.local, {required this.networkInfo});

  @override
  Future<Either<List<AzkerModel>, Failure>> getAzker(String endpoint) async {
    try {
      final localAzkar = await local.getLastZaker(endpoint);
      _tryToUpdateData(endpoint); // لا تؤثر على النتيجة مباشرةً
      return left(localAzkar);
    } catch (_) {
      // إذا فشل الـ local نحاول عبر الـ remote
      if (await networkInfo.isConnected) {
        try {
          final remoteModel = await remote.getAzker(endpoint);
          await local.cacheAzaker(remoteModel, endpoint);
          return left(remoteModel);
        } on ServerException catch (e) {
          return right(Failure(errMessage: e.errorModel.errorMessage));
        } catch (e) {
          return right(Failure(errMessage: 'Unexpected error: $e'));
        }
      } else {
        return right(Failure(errMessage: 'No internet connection'));
      }
    }
  }

  void _tryToUpdateData(String endpoint) {
    Future.microtask(() async {
      if (await networkInfo.isConnected) {
        try {
          final remoteModel = await remote.getAzker(endpoint);
          await local.cacheAzaker(remoteModel, endpoint);
        } catch (_) {}
      }
    });
  }
}
