import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/beforesleepazker/domain/entities/beforesleepazkar_entitiy.dart';
import 'package:hasna/features/beforesleepazker/domain/usecases/beforesleepazkar_usecase.dart';

part 'beforesleepazkar_state.dart';

class BeforesleepazkarCubit extends Cubit<BeforesleepazkarState> {
  BeforesleepazkarCubit(this._useCase) : super(BeforesleepazkarInitial());

  final BeforesleepazkarUseCase _useCase;

  void initIfNeeded() {
    if (state is! BeforesleepazkarLoaded) {
      getBeforesleepAzkar();
    }
  }

  void getBeforesleepAzkar() async {
    emit(BeforesleepazkarLoading());

    final result = await _useCase.getBeforesleepazker();

    result.fold(
      (azkarList) {
        emit(BeforesleepazkarLoaded(before: azkarList));
      },
      (failure) {
        emit(BeforesleepazkarError(error: failure.toString()));
      },
    );
  }
}
