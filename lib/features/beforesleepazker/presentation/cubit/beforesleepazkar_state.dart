part of 'beforesleepazkar_cubit.dart';

abstract class BeforesleepazkarState extends Equatable {
  const BeforesleepazkarState();

  @override
  List<Object> get props => [];
}

class BeforesleepazkarInitial extends BeforesleepazkarState {}
class EveningazkerLoading extends BeforesleepazkarState {}
class BeforesleepazkarLoaded extends BeforesleepazkarState {
  final List<EveningakerEntitiy> eveningakerEntitiy;

  const BeforesleepazkarLoaded({required this.eveningakerEntitiy});

  @override
  List<Object> get props => [eveningakerEntitiy];
}
class BeforesleepazkarError extends BeforesleepazkarState {
  final String error;

  const BeforesleepazkarError({required this.error});

  @override
  List<Object> get props => [error];
}
