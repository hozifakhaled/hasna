part of 'azker_cubit.dart';

abstract class AzkerState extends Equatable {
  const AzkerState();

  @override
  List<Object> get props => [];
}

class AzkerInitial extends AzkerState {}
class AzkerLoading extends AzkerState {}
class AzkerLoaded extends AzkerState {
  final List<AkerEntitiy> akerEntitiy;

  const AzkerLoaded({required this.akerEntitiy});

  @override
  List<Object> get props => [akerEntitiy];
}
class AzkerError extends AzkerState {
  final String error;

  const AzkerError({required this.error});

  @override
  List<Object> get props => [error];
}
