import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/hadiths/domain/entities/hadith_entity.dart';
import 'package:hasna/features/hadiths/domain/usecases/hadith_usecase.dart';

part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  final HadithUsecase hadithUsecase;
  HadithsCubit(this.hadithUsecase) : super(HadithsInitial());

  Future<void> getHadith() async {
    emit(HadithsLoading());
    final result = await hadithUsecase.getHadith();
    result.fold(
      (failure) => emit(HadithsError(errorMessage: failure.errMessage)), 
      (hadith) {
        emit(HadithsLoaded(hadith: hadith));
      },
    );
  }
}

