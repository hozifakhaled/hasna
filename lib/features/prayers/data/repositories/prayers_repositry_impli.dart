import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/prayers/data/datasources/prayers_datasource_remote.dart';
import 'package:hasna/features/prayers/data/datasources/prayers_datasourse_local.dart';
import 'package:hasna/features/prayers/data/models/prayers_model.dart';
import 'package:hasna/features/prayers/domain/repositories/prayer_repositry.dart';

class PrayersRepositryImpli implements PrayerRepositry {
  final NetworkInfo networkInfo;
  final PrayersDatasourceRemote remote;
  final PrayersDatasourseLocal local;

  PrayersRepositryImpli({
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<List<PrayersModel>, Failure>> getPrayers() async {
    try {
      final localPrayers = await local.getLastPrayers();
      _tryToUpdateData(); // تحديث في الخلفية
      return left(localPrayers);
    } catch (_) {
      if (await networkInfo.isConnected) {
        try {
          final remotePrayers = await remote.getPrayers();
          await local.cachePrayers(remotePrayers);
          return left(remotePrayers);
        } on ServerException catch (e) {
          return right(Failure(errMessage: e.errorModel.errorMessage));
        } catch (e) {
          return right(Failure(errMessage: 'Unexpected error: $e'));
        }
      } else {
        return right(Failure(errMessage: 'No internet connection'));
      }
    }
  }

  void _tryToUpdateData() {
    Future.microtask(() async {
      if (await networkInfo.isConnected) {
        try {
          final remotePrayers = await remote.getPrayers();
          await local.cachePrayers(remotePrayers);
        } catch (_) {
          // تجاهل أي خطأ في الخلفية
        }
      }
    });
  }
}
