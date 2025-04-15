import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveningazker_datasource_local.dart';
import 'package:hasna/features/eveningazker/data/datasources/eveningazker_datasource_remote.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';

class EveningRepositryImpli implements EveningRepositry {
  final NetworkInfo networkInfo;
  final EveningazkerDatasourceRemote remote;
  final EveingazkerDatasourceLocal local;

  EveningRepositryImpli(this.remote, this.local, {required this.networkInfo});
  @override
  Future<Either<EveningModel, Failure>> getEveningAzker({required int page})async {
    if (await networkInfo.isConnected!) {
     try {
        final remoteEvening = await remote.getEveningAzker(page: page);

        local.cacheEveningzaker(remoteEvening, page.toString());
        return left(remoteEvening);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
     try {
  final localEvening = await local.getLastEveningZaker(page.toString());
  return left(localEvening);
}  on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
  }
  }
 
  
