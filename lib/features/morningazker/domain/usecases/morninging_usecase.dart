import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';

class MorningingUsecase {
  final MorningRepositry morningRepositry;
  MorningingUsecase({required this.morningRepositry});
  Future<Either<List< MorningModel>, Failure>> getmorningAzker() async {
    return await morningRepositry.getMorningAzker();
  }
}