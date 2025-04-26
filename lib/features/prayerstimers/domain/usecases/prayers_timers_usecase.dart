import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';
import 'package:hasna/features/prayerstimers/domain/repositories/prayers_timers_repositry.dart';

class PrayersTimersUsecase {
  final PrayersTimersRepositry prayersTimersRepositry;
  PrayersTimersUsecase({required this.prayersTimersRepositry});
  Future<Either<PrayersTimersEntity, Failure>> getPrayersTimers() async {
    return await prayersTimersRepositry.getPrayersTimers();
  }
}