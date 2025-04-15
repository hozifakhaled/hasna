import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eveningazker_state.dart';

class EveningazkerCubit extends Cubit<EveningazkerState> {
  EveningazkerCubit() : super(EveningazkerInitial());
}
