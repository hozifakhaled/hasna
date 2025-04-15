import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';

class EveningRepositryImpli implements EveningRepositry {
  @override
  Either<Future<EveningModel>, Failure> getEveningAzker({int page = 1}) {
    // TODO: implement getEveningAzker
    throw UnimplementedError();
  }
}