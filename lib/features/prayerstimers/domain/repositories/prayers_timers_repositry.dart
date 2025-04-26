import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';

abstract class PrayersTimersRepositry {
  Future<Either<PrayersTimersEntity, Failure>> getPrayersTimers();
}