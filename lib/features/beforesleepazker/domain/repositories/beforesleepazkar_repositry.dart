import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/beforesleepazker/domain/entities/beforesleepazkar_entitiy.dart';

abstract class BeforesleepazkarRepositry {
  Future<Either<List<BeforesleepazkarEntitiy>, Failure>> getBeforesleepazker(); 
  // This method should be implemented in the concrete repository class.
}
