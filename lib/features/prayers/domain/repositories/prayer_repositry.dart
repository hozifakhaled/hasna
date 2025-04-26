import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/prayers/domain/entities/prayers_entitity.dart';

abstract class PrayerRepositry {
  Future<Either<List<PrayersEntitiy>, Failure>> getPrayers();
}