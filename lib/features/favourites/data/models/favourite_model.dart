import 'package:hive/hive.dart';


part 'favourite_model.g.dart';

@HiveType(typeId: 1)
class FavouriteModel extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
   final String description;

  FavouriteModel(this.id, {
    required this.description,
  });
  
}