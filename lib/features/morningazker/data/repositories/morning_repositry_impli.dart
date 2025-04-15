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
  Future<Either<MorningModel, Failure>> getMorningAzker({required int page})async {
  
    if (await networkInfo.isConnected!) {
     try {
        final remoteMorning = await remote.getMorningAzker(page: page);

        local.cacheMorningzaker(remoteMorning, page.toString());
        return left(remoteMorning);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
     try {
  final localMorning = await local.getLastMorningingZaker(page.toString());
  return left(localMorning);
}  on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
  }
  
  }
  
 
 
  
