import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hadiths_state.dart';

class HadithsCubit extends Cubit<HadithsState> {
  HadithsCubit() : super(HadithsInitial());
}
