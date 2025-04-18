import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_local.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_remote.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';

class MorningRepositryImpli implements MorningRepositry {
  final NetworkInfo networkInfo;
  final MorningazkerDatasourceRemote remote;
  final MorningazkerDatasourceLocal local;

  MorningRepositryImpli(this.remote, this.local, {required this.networkInfo});

  @override
  Future<Either<List<MorningModel>, Failure>> getMorningAzker() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMorningList = await remote.getMorningAzker();
        for (var morningModel in remoteMorningList) {
          local.cacheMorningzaker(morningModel , morningModel.id.toString());
        }
        return left(remoteMorningList);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localMorning = await local.getLastMorningingZaker( '1');
        if (localMorning != null) {
          return left([localMorning]);
        } else {
          return right(Failure(errMessage: 'No cached data available'));
        }
      } on CacheExeption catch (e) {
        return right(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
