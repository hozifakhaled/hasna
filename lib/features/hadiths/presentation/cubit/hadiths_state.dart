part of 'hadiths_cubit.dart';

abstract class HadithsState extends Equatable {
  const HadithsState();

  @override
  List<Object> get props => [];
}

class HadithsInitial extends HadithsState {}

class HadithsLoading extends HadithsState {}

class HadithsLoaded extends HadithsState {
  final HadithEntity hadith;

  const HadithsLoaded({required this.hadith});

  @override
  List<Object> get props => [hadith];
}

class HadithsError extends HadithsState {
  final String errorMessage;

  const HadithsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
