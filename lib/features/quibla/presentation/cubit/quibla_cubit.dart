import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quibla_state.dart';

class QuiblaCubit extends Cubit<QuiblaState> {
  QuiblaCubit() : super(QuiblaInitial());
}
