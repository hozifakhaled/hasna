import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/azker/domain/entities/aker_entitiy.dart';
import 'package:hasna/features/azker/domain/usecases/azkar_usecase.dart';

part 'azker_state.dart';

class AzkerCubit extends Cubit<AzkerState> {
  AzkerCubit(this._azkerUseCase) : super(AzkerInitial());

  
   final AzkarUsecase _azkerUseCase ;
   
void initIfNeedes(String endpoint) {
    if (state is !AzkerLoaded) {
      getAzker(endpoint);
    }
  }
  void getAzker(String endpoint ) async {
  //  EveningUseCase eveningUseCase = EveningUseCase(eveningRepositry: sl());
    emit(AzkerLoading());
    final result = await _azkerUseCase.getAzker(endpoint);
    result.fold(
      (eveningModel) {
        emit(AzkerLoaded(akerEntitiy: eveningModel));
      },
      (error) {
        emit(AzkerError(error: error.toString()));
      },
    );
  }
}