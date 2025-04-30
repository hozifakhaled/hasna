part of 'publicazkar_cubit.dart';

abstract class PublicazkarState extends Equatable {
  const PublicazkarState();

  @override
  List<Object> get props => [];
}

class PublicazkarInitial extends PublicazkarState {}

class PublicazkarLoading extends PublicazkarState {}

class PublicazkarSuccess extends PublicazkarState {
  final List<TasabihModel> tasabih;
  const PublicazkarSuccess(this.tasabih);
}

class PublicazkarFailure extends PublicazkarState {
  final String error;
  const PublicazkarFailure(this.error);
  @override
  List<Object> get props => [error];
}
