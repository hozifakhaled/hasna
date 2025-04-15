import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/morningazker/domain/entities/morningaker_entitiy.dart';
import 'package:hasna/features/morningazker/domain/usecases/morninging_usecase.dart';

part 'morningazker_state.dart';

class MorningazkerCubit extends Cubit<MorningazkerState> {
  final MorningingUsecase morningingUsecase;
  MorningazkerCubit(this.morningingUsecase) : super(MorningazkerInitial());

  void getMorningAzker(int page) async {
    emit(MorningazkerLoading());
    final result = await morningingUsecase.getmorningAzker(page: page);
    result.fold(
      (morningModel) {
        emit(MorningazkerLoaded(morningazkerEntitiy: morningModel));
      },
      (error) {
        emit(MorningazkerError(errorMessage: error.toString()));
      },
    );
  }
}
