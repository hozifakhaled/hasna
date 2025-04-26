import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/prayers/domain/entities/prayers_entitity.dart';
import 'package:hasna/features/prayers/domain/usecases/prayers_usecase.dart';

part 'prayers_state.dart';

class PrayersCubit extends Cubit<PrayersState> {
  PrayersCubit(this._prayersUsecase) : super(PrayersInitial());
  final PrayersUsecase _prayersUsecase ;void initIfNeedes() {
    if (state is !PrayersLoaded) {
      getPrayers();
    }
  }
  void getPrayers() async{
emit(PrayersLoading());
    final result = await _prayersUsecase.call();
    result.fold(
      (prayersModel) {
        emit(PrayersLoaded(prayersList: prayersModel));
      },
      (error) {
        emit(PrayersError(errorMessage: error.toString()));
      },
    );
  }
}
