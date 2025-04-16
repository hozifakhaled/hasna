import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';

class EveningUseCase {
  final EveningRepositry eveningRepositry;
  EveningUseCase({required this.eveningRepositry});
  Future<Either<List<EveningakerEntitiy>, Failure>> getEveningAzker() async {
    return await eveningRepositry.getEveningAzker();
  }
}