import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/core/di/getit.dart';
import 'package:hasna/features/beforesleepazker/domain/entities/beforesleepazkar_entitiy.dart';
import 'package:hasna/features/beforesleepazker/domain/usecases/beforesleepazkar_usecase.dart';

part 'beforesleepazkar_state.dart';

class BeforesleepazkarCubit extends Cubit<BeforesleepazkarState> {
  BeforesleepazkarCubit(this.beforesleepazkarUseCase) : super(BeforesleepazkarInitial());

   final BeforesleepazkarUseCase beforesleepazkarUseCase ;
   
void initIfNeedes() {
    if (state is BeforesleepazkarLoaded) {
      getEveningAzker();
    }
  }
  void getEveningAzker( ) async {
    BeforesleepazkarUseCase beforesleepazkarUseCase= BeforesleepazkarUseCase(beforesleepazkarRepositry: sl());
    emit(BeforesleepazkarLoading());
    final result = await beforesleepazkarUseCase.getBeforesleepazker();
    result.fold(
      (beforemodel) {
        emit(BeforesleepazkarLoaded(beforesleepazkarEntitiy: beforemodel));
      },
      (error) {
        emit(BeforesleepazkarError(error: error.toString()));
      },
    );
  }
}