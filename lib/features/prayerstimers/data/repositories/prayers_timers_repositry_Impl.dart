import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/azker/data/models/azkar_model.dart';
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_local.dart';
import 'package:hasna/features/prayerstimers/data/datasources/prayers_timers_datasource_remote.dart';
import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';
import 'package:hasna/features/prayerstimers/domain/repositories/prayers_timers_repositry.dart';

class PrayersTimersRepositryImpl extends PrayersTimersRepositry {
  final NetworkInfo networkInfo;
  final PrayersTimersDatasourceLocal local;
  final PrayersTimersDatasourceRemote remote;

  PrayersTimersRepositryImpl(
    this.remote,
    this.local, {
    required this.networkInfo,
  });

  @override
  Future<Either<PrayersTimersEntity, Failure>> getPrayersTimers() async {
    if (await networkInfo.isConnected) {
      try {
        // جلب البيانات من الـ API
        final remoteMorningModel = await remote.getPrayersTimers();

        // تخزين البيانات في الكاش
        local.cachePrayerstimers(remoteMorningModel);

        // إرجاع البيانات من الـ API
        return left(remoteMorningModel);
      } on ServerException catch (e) {
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localPrayerstimers = await local.getLastPrayerstimers();
        if (localPrayerstimers != null) {
          return left(localPrayerstimers);
        } else {
          return right(Failure(errMessage: 'No cached data available'));
        }
      } on CacheExeption catch (e) {
        return right(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
