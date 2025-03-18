import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prayers_state.dart';

class PrayersCubit extends Cubit<PrayersState> {
  PrayersCubit() : super(PrayersInitial());
}
