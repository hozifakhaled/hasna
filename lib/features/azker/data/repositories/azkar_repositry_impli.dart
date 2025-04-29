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
  Future<Either<List<AzkerModel>, Failure>> getAzker(String endpoint)async {
    if (await networkInfo.isConnected) {
     try {
        final remoteAzker = await remote.getAzker(endpoint);

        local.cacheAzaker(remoteAzker, endpoint);
        return left(remoteAzker);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
     try {
  final localazker = await local.getLastZaker(endpoint);
  return left(localazker);
}  on CacheExeption  {
        return right(Failure(errMessage:'no internet'));
      }
    }
  }
  }
 
  
