import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/azker/domain/entities/aker_entitiy.dart';

abstract class AzkarRepositry {
  Future<Either<List<AkerEntitiy>, Failure>> getAzker(String endpoint); 
  // This method should be implemented in the concrete repository class.
}
