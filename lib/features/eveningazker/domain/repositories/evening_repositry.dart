import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';

abstract class EveningRepositry {
  Future<Either<EveningModel, Failure>> getEveningAzker({int page = 1}); 
  // This method should be implemented in the concrete repository class.
}
