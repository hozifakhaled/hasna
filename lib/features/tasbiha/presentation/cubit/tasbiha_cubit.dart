import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasbiha_state.dart';

class TasbihaCubit extends Cubit<TasbihaState> {
  TasbihaCubit() : super(TasbihaInitial());
}
