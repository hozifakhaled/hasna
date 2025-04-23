import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';
import 'package:hasna/features/eveningazker/domain/usecases/evening_usecase.dart';

part 'eveningazker_state.dart';

class EveningazkerCubit extends Cubit<EveningazkerState> {
  EveningazkerCubit(this._eveningUseCase) : super(EveningazkerInitial());

  
   final EveningUseCase _eveningUseCase ;
   
void initIfNeedes() {
    if (state is !EveningazkerLoaded) {
      getEveningAzker();
    }
  }
  void getEveningAzker( ) async {
  //  EveningUseCase eveningUseCase = EveningUseCase(eveningRepositry: sl());
    emit(EveningazkerLoading());
    final result = await _eveningUseCase.getEveningAzker();
    result.fold(
      (eveningModel) {
        emit(EveningazkerLoaded(eveningakerEntitiy: eveningModel));
      },
      (error) {
        emit(EveningazkerError(error: error.toString()));
      },
    );
  }
}