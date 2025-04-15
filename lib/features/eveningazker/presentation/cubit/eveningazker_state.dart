part of 'eveningazker_cubit.dart';

abstract class EveningazkerState extends Equatable {
  const EveningazkerState();

  @override
  List<Object> get props => [];
}

class EveningazkerInitial extends EveningazkerState {}
class EveningazkerLoading extends EveningazkerState {}
class EveningazkerLoaded extends EveningazkerState {
  final EveningakerEntitiy eveningakerEntitiy;

  const EveningazkerLoaded({required this.eveningakerEntitiy});

  @override
  List<Object> get props => [eveningakerEntitiy];
}
class EveningazkerError extends EveningazkerState {
  final String error;

  const EveningazkerError({required this.error});

  @override
  List<Object> get props => [error];
}
