part of 'beforesleepazkar_cubit.dart';

abstract class BeforesleepazkarState extends Equatable {
  const BeforesleepazkarState();

  @override
  List<Object> get props => [];
}

class BeforesleepazkarInitial extends BeforesleepazkarState {}
class BeforesleepazkarLoading extends BeforesleepazkarState {}
class BeforesleepazkarLoaded extends BeforesleepazkarState {
  final List<BeforesleepazkarEntitiy> beforesleepazkarEntitiy;

  const BeforesleepazkarLoaded({required this.beforesleepazkarEntitiy});

  @override
  List<Object> get props => [beforesleepazkarEntitiy];
}
class BeforesleepazkarError extends BeforesleepazkarState {
  final String error;

  const BeforesleepazkarError({required this.error});

  @override
  List<Object> get props => [error];
}
