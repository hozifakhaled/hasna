import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/core/databases/cache/cache_helper.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/prayerstimers/data/models/prayers_timers_model.dart';
import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';
import 'package:hasna/features/prayerstimers/domain/usecases/prayers_timers_usecase.dart';

part 'prayerstimers_state.dart';

class PrayerstimersCubit extends Cubit<PrayerstimersState> {
  final PrayersTimersUsecase prayersTimersUsecase;

  PrayerstimersCubit(this.prayersTimersUsecase) : super(PrayerstimersInitial());
  final CacheHelper cache = sl<CacheHelper>();
  final String keys = "CachedPrayerstimers";
  // ignore: prefer_typing_uninitialized_variables

  PrayersTimersEntity? loadinig() {
    final jsonString = cache.getDataString(key: keys);
    if (jsonString != null) {
      return PrayersTimersModel.fromJson(json.decode(jsonString));
    } else {
      return null;
    }
  }

  Future<void> getPrayersTimers() async {
    emit(PrayerstimersLoading(prayersTimers: loadinig()??PrayersTimersEntity(nextPrayer: PrayerInfo(name: 'الفجر', time: '4:30'),hijri: Datehijri(day: "3", month: "5", weekday: "9", year: "1446")) ));
    final result = await prayersTimersUsecase.getPrayersTimers();

    result.fold(
      (prayers) => emit(PrayerstimersSuccess(prayersTimers: prayers)),
      (error) => emit(PrayerstimersError(message: error.errMessage)),
    );
  }
}
