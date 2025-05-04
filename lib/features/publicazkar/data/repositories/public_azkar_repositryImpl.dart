import 'package:hasna/constants/strings.dart';
import 'package:hasna/features/publicazkar/data/models/tasabih_model.dart';
import 'package:hive/hive.dart';

class PublicAzkarRepositryimpl {
  Future<Box<TasabihModel>> _getBox() {
    return Hive.openBox<TasabihModel>(kbox);
  }

  Future<void> addTasabih(TasabihModel tasabihModel) async {
    final box = await _getBox();
    await box.put(tasabihModel.id, tasabihModel);
  }

  Future<void> deleteTasabih(int id) async {
    final box = await _getBox();
    await box.delete(id);
  }

  Future<List<TasabihModel>> getAllTasabih() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> updateTasabih(TasabihModel tasabihModel) async {
    final box = await _getBox();
    await box.put(tasabihModel.id, tasabihModel);
  }

  Future<TasabihModel?> getTasabihById(int id) async {
    final box = await _getBox();
    return box.get(id);
  }

 

  // دالة لحساب المجموع الكلي لجميع التسابيح
  Future<int> getTotalSum() async {
    final box = await _getBox();
    final allTasabih = box.values.toList();
    
    int totalSum = 0;
    for (var tasbih in allTasabih) {
      totalSum += tasbih.sumNumber;
    }
    
    return totalSum;
  }

  Future<void> deleteAllTasabih() async {
    final box = await _getBox();
    await box.clear();
  }
}