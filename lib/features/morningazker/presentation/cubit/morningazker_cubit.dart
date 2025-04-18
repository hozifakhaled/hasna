import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/morningazker/domain/entities/morningaker_entitiy.dart';
import 'package:hasna/features/morningazker/domain/usecases/morninging_usecase.dart';

part 'morningazker_state.dart';

class MorningazkerCubit extends Cubit<MorningazkerState> {
  final MorningingUsecase morningingUsecase;
   int count;
  MorningazkerCubit(this.morningingUsecase, this.count) : super(MorningazkerInitial());

  void getAllMorningAzker() async {
    emit(MorningazkerLoading());
    final result = await morningingUsecase.getmorningAzker(); // بدون صفحة

    result.fold(
      (azkarList) {
        emit(MorningazkerLoaded(morningazkerEntitiy: azkarList));
      },
      (error) {
        emit(MorningazkerError(errorMessage: error.toString()));
      },
    );
  }

  void initializeIfNeeded() {
  if (state is! MorningazkerLoaded) {
    getAllMorningAzker();
  }
}

void EcdCount(int index) {
  if (state is MorningazkerLoaded) {
    final currentState = state as MorningazkerLoaded;
    final list = List<MorningakerEntitiy>.from(currentState.morningazkerEntitiy);

    if (list[index].count > 0) {
      list[index] = list[index].copyWith(count: list[index].count - 1);
      emit(MorningazkerLoaded(morningazkerEntitiy: list));
    } else {
      emit(Morningzekrtransaction());
    }
  }
}



  @override
  Future<void> close() {
    return super.close();
  }
}
