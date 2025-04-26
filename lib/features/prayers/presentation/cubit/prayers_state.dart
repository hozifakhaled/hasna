part of 'prayers_cubit.dart';

abstract class PrayersState extends Equatable {
  const PrayersState();

  @override
  List<Object> get props => [];
}

class PrayersInitial extends PrayersState {}
class PrayersLoading extends PrayersState {}
class PrayersLoaded extends PrayersState {
  final List<PrayersEntitiy> prayersList;
  const PrayersLoaded({required this.prayersList});
  @override
  List<Object> get props => [prayersList];
}
class PrayersError extends PrayersState {
  final String errorMessage;
  const PrayersError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}