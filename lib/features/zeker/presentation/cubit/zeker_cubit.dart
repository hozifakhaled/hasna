import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'zeker_state.dart';

class ZekerCubit extends Cubit<ZekerState> {
  ZekerCubit() : super(ZekerInitial());
}
