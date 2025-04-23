import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/beforesleepazker/domain/entities/beforesleepazkar_entitiy.dart';
import 'package:hasna/features/beforesleepazker/domain/repositories/beforesleepazkar_repositry.dart';

class BeforesleepazkarUseCase {
  final BeforesleepazkarRepositry beforesleepazkarRepositry ;
  BeforesleepazkarUseCase({required this.beforesleepazkarRepositry});
  Future<Either<List<BeforesleepazkarEntitiy>, Failure>> getEveningAzker() async {
    return await beforesleepazkarRepositry.getBeforesleepazker();
  }
}