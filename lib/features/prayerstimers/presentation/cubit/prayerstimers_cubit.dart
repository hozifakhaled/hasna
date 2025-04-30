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
  

  Future<void> getPrayersTimers() async {
    emit(PrayerstimersLoading());
    final result = await prayersTimersUsecase.getPrayersTimers();

    result.fold(
      (prayers) => emit(PrayerstimersSuccess(prayersTimers: prayers)),
      (error) => emit(PrayerstimersError(message: error.errMessage)),
    );
  }
}
