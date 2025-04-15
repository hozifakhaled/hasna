import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'morningazker_state.dart';

class MorningazkerCubit extends Cubit<MorningazkerState> {
  MorningazkerCubit() : super(MorningazkerInitial());
}
