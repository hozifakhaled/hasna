part of 'prayerstimers_cubit.dart';

abstract class PrayerstimersState extends Equatable {
  const PrayerstimersState();

  @override
  List<Object> get props => [];
}

class PrayerstimersInitial extends PrayerstimersState {}

class PrayerstimersLoading extends PrayerstimersState {
  final PrayersTimersEntity prayersTimers;

  const PrayerstimersLoading({required this.prayersTimers});
}

class PrayerstimersSuccess extends PrayerstimersState {
  final PrayersTimersEntity prayersTimers;

  const PrayerstimersSuccess({required this.prayersTimers});

  @override
  List<Object> get props => [prayersTimers];
}

class PrayerstimersError extends PrayerstimersState {
  final String message;

  const PrayerstimersError({required this.message});

  @override
  List<Object> get props => [message];
}
