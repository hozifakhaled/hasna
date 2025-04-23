import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/beforesleepazker/data/datasources/beforesleepazkar_datasource_local.dart';
import 'package:hasna/features/beforesleepazker/data/datasources/beforesleepazkar_datasource_remote.dart';
import 'package:hasna/features/beforesleepazker/data/models/beforesleepazkar_model.dart';
import 'package:hasna/features/beforesleepazker/domain/repositories/beforesleepazkar_repositry.dart';

class BeforesleepazkarRepositryImpli implements BeforesleepazkarRepositry  {
  final NetworkInfo networkInfo;
  final BeforesleepazkarDatasourceRemote remote;
  final BeforesleepazkarDatasourceLocal local;

  BeforesleepazkarRepositryImpli(this.remote, this.local, {required this.networkInfo});
  @override
  Future<Either<List<BeforesleepazkarModel>, Failure>> getBeforesleepazker()async {
    if (await networkInfo.isConnected) {
     try {
        final remoteSleep = await remote.getBeforesleepazkar();

        local.cacheBeforesleepazkar(remoteSleep);
        return left(remoteSleep);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
     try {
  final localSleep = await local.getLastBeforesleepazkar();
  return left(localSleep);
}  on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
  }

 
  }
 
  
