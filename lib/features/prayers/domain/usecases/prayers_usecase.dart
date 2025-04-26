import 'package:dartz/dartz.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/prayers/domain/entities/prayers_entitity.dart';
import 'package:hasna/features/prayers/domain/repositories/prayer_repositry.dart';

class PrayersUsecase {
  final PrayerRepositry repositry;
  PrayersUsecase({required this.repositry});

  Future<Either<List<PrayersEntitiy>, Failure>> call() =>
      repositry.getPrayers();
}
