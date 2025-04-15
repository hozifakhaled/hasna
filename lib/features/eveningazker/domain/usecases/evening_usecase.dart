import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/eveningazker/data/models/evening_model.dart';
import 'package:hasna/features/eveningazker/domain/repositories/evening_repositry.dart';

class EveningUseCase {
  final EveningRepositry eveningRepositry;
  EveningUseCase({required this.eveningRepositry});
  Future<Either<EveningModel, Failure>> getEveningAzker({int page = 1}) async {
    return await eveningRepositry.getEveningAzker(page: page);
  }
}