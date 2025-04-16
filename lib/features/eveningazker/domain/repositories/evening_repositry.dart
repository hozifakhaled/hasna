import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';
import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';

abstract class EveningRepositry {
  Future<Either<List<EveningakerEntitiy>, Failure>> getEveningAzker(); 
  // This method should be implemented in the concrete repository class.
}
