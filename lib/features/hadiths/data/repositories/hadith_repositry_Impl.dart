import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/error_model.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/hadiths/data/datasources/hadith_local_datasource.dart';
import 'package:hasna/features/hadiths/data/datasources/hadith_remote_datasource.dart';
import 'package:hasna/features/hadiths/domain/entities/hadith_entity.dart';
import 'package:hasna/features/hadiths/domain/repositories/hadith_repositry.dart';

class HadithRepositryImpl extends HadithRepositry {
  final HadithLocalDatasource hadithLocalDataSource;
  final HadithRemoteDatasource hadithRemoteDataSource;
  final NetworkInfo networkInfo;

  HadithRepositryImpl({
    required this.hadithLocalDataSource,
    required this.hadithRemoteDataSource,
    required this.networkInfo,
  });

@override
Future<Either<Failure, HadithEntity>> getHadith() async {
  
  try {
    final localHadith = await hadithLocalDataSource.getLastHadith();
    
    _tryToUpdateCacheInBackground();
    
    return Right(localHadith);
  } catch (cacheError) {
    if (await networkInfo.isConnected) {
      try {
        final remoteHadith = await hadithRemoteDataSource.getHadith();
        await hadithLocalDataSource.cacheHadiths(remoteHadith);
        return Right(remoteHadith);
      } catch (serverError) {
        return Left(ServerException(ErrorModel(
          status: 500,
          errorMessage: "خطأ في الاتصال بالخادم: $serverError",
        )));
      }
    } else {
      return Left(CacheExeption(errorMessage: "لا توجد بيانات مخزنة ولا يوجد اتصال بالإنترنت"));
    }
  }
}

void _tryToUpdateCacheInBackground() {
  Future.microtask(() async {
    try {
      await Future.delayed(Duration(milliseconds: 300));
      if (await networkInfo.isConnected) {
        final remoteHadith = await hadithRemoteDataSource.getHadith();
        await hadithLocalDataSource.cacheHadiths(remoteHadith);
      }
    } catch (e) {
      print("خطأ في تحديث البيانات في الخلفية: $e");
    }
  });
}
}
