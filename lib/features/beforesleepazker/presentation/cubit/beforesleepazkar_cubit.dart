import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';
import 'package:hasna/features/eveningazker/domain/usecases/evening_usecase.dart';

part 'beforesleepazkar_state.dart';

class BeforesleepazkarCubit extends Cubit<BeforesleepazkarState> {
  BeforesleepazkarCubit(this.eveningUseCase) : super(BeforesleepazkarInitial());

  
   final EveningUseCase eveningUseCase ;
   
void initIfNeedes() {
    if (state is BeforesleepazkarLoaded) {
      getEveningAzker();
    }
  }
  void getEveningAzker( ) async {
    EveningUseCase eveningUseCase = EveningUseCase(eveningRepositry: sl());
    emit(EveningazkerLoading());
    final result = await eveningUseCase.getEveningAzker();
    result.fold(
      (eveningModel) {
        emit(BeforesleepazkarLoaded(eveningakerEntitiy: eveningModel));
      },
      (failure) {
        emit(BeforesleepazkarError(error: failure.toString()));
      },
    );
  }
}
