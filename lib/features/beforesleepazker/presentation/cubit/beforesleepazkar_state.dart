part of 'beforesleepazkar_cubit.dart';

abstract class BeforesleepazkarState extends Equatable {
  const BeforesleepazkarState();

  @override
  List<Object> get props => [];
}

class BeforesleepazkarInitial extends BeforesleepazkarState {}
class BeforesleepazkarLoading extends BeforesleepazkarState {}
class BeforesleepazkarLoaded extends BeforesleepazkarState {
  final List<BeforesleepazkarEntitiy> before;

  const BeforesleepazkarLoaded({required this.before});

  @override
  List<Object> get props => [before];
}
class BeforesleepazkarError extends BeforesleepazkarState {
  final String error;

  const BeforesleepazkarError({required this.error});

  @override
  List<Object> get props => [error];
}
