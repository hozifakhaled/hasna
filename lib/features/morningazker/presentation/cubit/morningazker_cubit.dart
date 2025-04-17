import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/morningazker/domain/entities/morningaker_entitiy.dart';
import 'package:hasna/features/morningazker/domain/usecases/morninging_usecase.dart';

part 'morningazker_state.dart';

class MorningazkerCubit extends Cubit<MorningazkerState> {
  final MorningingUsecase morningingUsecase;

  MorningazkerCubit(this.morningingUsecase) : super(MorningazkerInitial());

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


  @override
  Future<void> close() {
    return super.close();
  }
}
