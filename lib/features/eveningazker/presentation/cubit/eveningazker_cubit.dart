import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';
import 'package:hasna/features/eveningazker/domain/usecases/evening_usecase.dart';

part 'eveningazker_state.dart';

class EveningazkerCubit extends Cubit<EveningazkerState> {
  EveningazkerCubit(this.eveningUseCase) : super(EveningazkerInitial());

  
   final EveningUseCase eveningUseCase ;
   

  void getEveningAzker(int page) async {
    EveningUseCase eveningUseCase = EveningUseCase(eveningRepositry: sl());
    emit(EveningazkerLoading());
    final result = await eveningUseCase.getEveningAzker(page:page );
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