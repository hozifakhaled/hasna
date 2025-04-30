import 'package:hive/hive.dart';
part 'tasabih_model.g.dart';
@HiveType(typeId: 0)
class TasabihModel extends HiveObject {
  @HiveField(0)
  String taxt;
  @HiveField(1)
  int number;
  @HiveField(2)
  int id;
  @HiveField(3)
  int sumNumber;

  TasabihModel({
    required this.taxt,
    required this.number,
    required this.id,
    required this.sumNumber,
  });   
}
