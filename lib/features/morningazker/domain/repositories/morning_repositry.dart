import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';

abstract class MorningRepositry {
  Future<Either<List<MorningModel>, Failure>> getMorningAzker();
}

