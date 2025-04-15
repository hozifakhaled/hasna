import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';

class EveningRepositryImpli implements EveningRepositry {
  @override
  Future<Either<EveningModel, Failure>> getEveningAzker({required int page}) {
    // TODO: implement getEveningAzker
    throw UnimplementedError();
  }
 
  
}