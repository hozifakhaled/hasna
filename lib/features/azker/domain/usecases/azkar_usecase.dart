import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/azker/domain/entities/aker_entitiy.dart';
import 'package:hasna/features/azker/domain/repositories/azkar_repositry.dart';

class AzkarUsecase {
  final AzkarRepositry repositry;
  AzkarUsecase({required this.repositry});
  Future<Either<List<AkerEntitiy>, Failure>> getAzker(String endpoint) async {
    return await repositry.getAzker(endpoint);
  }
}
