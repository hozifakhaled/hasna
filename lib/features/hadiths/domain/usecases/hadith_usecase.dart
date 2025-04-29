import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/hadiths/domain/entities/hadith_entity.dart';
import 'package:hasna/features/hadiths/domain/repositories/hadith_repositry.dart';

class HadithUsecase {
  final HadithRepositry hadithRepositry;
  
  HadithUsecase(this.hadithRepositry);
  
  Future<Either<Failure, HadithEntity>> getHadith() async {
    final result = await hadithRepositry.getHadith();
    return result.fold(
      (failure) => Left(failure), 
      (hadith) => Right(hadith), 
    );
  }
}
