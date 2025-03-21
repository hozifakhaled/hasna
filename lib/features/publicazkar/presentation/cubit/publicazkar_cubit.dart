import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'publicazkar_state.dart';

class PublicazkarCubit extends Cubit<PublicazkarState> {
  PublicazkarCubit() : super(PublicazkarInitial());
}
