import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/hadiths/domain/entities/hadith_entity.dart';

abstract class HadithRepositry {
  Future<Either<Failure, HadithEntity>> getHadith();
}