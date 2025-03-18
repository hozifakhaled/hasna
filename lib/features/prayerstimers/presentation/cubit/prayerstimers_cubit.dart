import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prayerstimers_state.dart';

class PrayerstimersCubit extends Cubit<PrayerstimersState> {
  PrayerstimersCubit() : super(PrayerstimersInitial());
}
