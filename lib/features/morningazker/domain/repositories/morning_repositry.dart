import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

abstract class MorningRepositry {
  Future<Either<MorningModel, Failure>> getMorningAzker({required int page }); 
  // This method should be implemented in the concrete repository class.
}
