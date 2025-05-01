import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hasna/features/publicazkar/data/repositories/public_azkar_repositryImpl.dart';
part 'publicazkar_state.dart';

class PublicazkarCubit extends Cubit<PublicazkarState> {
  final PublicAzkarRepositryimpl publicAzkarRepositryimpl;

  PublicazkarCubit(this.publicAzkarRepositryimpl) : super(PublicazkarInitial());
  final zakerController = TextEditingController();
  final countController = TextEditingController();
  int dora = 0;
  void incrementDora(int value) {
   if (value ==1) {
      dora++;
    } 
  }

  Future<void> getAllTasabih() async {
    emit(PublicazkarLoading());
    try {
      final result = await publicAzkarRepositryimpl.getAllTasabih();
      emit(PublicazkarSuccess(result));
    } on Exception catch (e) {
      emit(PublicazkarFailure(e.toString()));
    } catch (e) {
      emit(PublicazkarFailure('An unexpected error occurred: $e'));
    }
  }

  Future<void> addTasabih(TasabihModel tasabihModel) async {
    emit(PublicazkarLoading());
    try {
      // إنشاء معرف فريد ضمن الحدود المسموح بها في Hive
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final safeId = timestamp % 0xFFFFFF; // يضمن أن المعرف أقل من 16,777,215

      final newTasbih = TasabihModel(
        id: safeId,
        taxt: tasabihModel.taxt,
        number: tasabihModel.number,
        sumNumber: tasabihModel.sumNumber,
      );

      await publicAzkarRepositryimpl.addTasabih(newTasbih);
      final updatedList = await publicAzkarRepositryimpl.getAllTasabih();
      emit(PublicazkarSuccess(updatedList));
    } catch (e) {
      emit(PublicazkarFailure('Failed to add tasbih: $e'));
    }
  }

  Future<void> deleteTasabih(int id) async {
    emit(PublicazkarLoading());
    try {
      await publicAzkarRepositryimpl.deleteTasabih(id);
      final updatedList = await publicAzkarRepositryimpl.getAllTasabih();
      emit(PublicazkarSuccess(updatedList));
    } catch (e) {
      emit(PublicazkarFailure('Failed to delete tasbih: $e'));
    }
  }

  Future<void> updateTasabih(TasabihModel tasabihModel) async {
    emit(PublicazkarLoading());
    try {
      await publicAzkarRepositryimpl.updateTasabih(tasabihModel);
      final updatedList = await publicAzkarRepositryimpl.getAllTasabih();
      await publicAzkarRepositryimpl.getAllTasabih();
      emit(PublicazkarSuccess(updatedList));
    } catch (e) {
      emit(PublicazkarFailure('Failed to update tasbih: $e'));
    }
  }

  Future<void> getTasabihById(int id) async {
    emit(PublicazkarLoading());
    try {
      final result = await publicAzkarRepositryimpl.getTasabihById(id);
      if (result != null) {
        emit(PublicazkarSuccess([result]));
      } else {
        emit(PublicazkarFailure('Tasabih not found'));
      }
    } catch (e) {
      emit(PublicazkarFailure('Failed to get tasbih: $e'));
    }
  }

  Future<int> getTotalSum() async {
    try {
      return await publicAzkarRepositryimpl.getTotalSum();
    } catch (e) {
      emit(PublicazkarFailure('Failed to get total sum: $e'));
      return 0;
    }
  }

  Future<void> deleteAllTasabih() async {
    emit(PublicazkarLoading());
    try {
      await publicAzkarRepositryimpl.deleteAllTasabih();
      emit(PublicazkarSuccess([]));
    } catch (e) {
      emit(PublicazkarFailure('Failed to delete all tasabih: $e'));
    }
  }
}
