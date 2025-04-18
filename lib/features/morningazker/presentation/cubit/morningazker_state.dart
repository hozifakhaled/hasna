part of 'morningazker_cubit.dart';

abstract class MorningazkerState extends Equatable {
  const MorningazkerState();

  @override
  List<Object> get props => [];
}

class MorningazkerInitial extends MorningazkerState {}

class MorningazkerLoaded extends MorningazkerState {
  final List<MorningakerEntitiy> morningazkerEntitiy;

  const MorningazkerLoaded({required this.morningazkerEntitiy});

  @override
  List<Object> get props => [morningazkerEntitiy];
}

class MorningazkerLoading extends MorningazkerState {}

class MorningazkerError extends MorningazkerState {
  final String errorMessage;

  const MorningazkerError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class Morningzekrtransaction extends MorningazkerState {

}