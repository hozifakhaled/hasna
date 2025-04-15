import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';

class MorningingUsecase {
  final MorningRepositry morningRepositry;
  MorningingUsecase({required this.morningRepositry});
  Future<Either<MorningModel, Failure>> getmorningAzker({required int page }) async {
    return await morningRepositry.getMorningAzker(page: page);
  }
}