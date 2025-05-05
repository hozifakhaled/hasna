import 'package:hasna/constants/strings.dart';
import 'package:hasna/features/favourites/data/models/favourite_model.dart';
import 'package:hive/hive.dart';

class FavouriteRepositryImpl {

  Future<Box<FavouriteModel>> _getBox() {
    return Hive.openBox<FavouriteModel>(boxFavourite);
  }
   void addToFavourite(FavouriteModel favouriteModel) async{
      final box =await _getBox();
    await  box.put(favouriteModel.id, favouriteModel);
   }

    void deleteFromFavourite(String id) async{
        final box =await _getBox();
     await   box.delete(id);
    }

    Future<List<FavouriteModel>> getAllFavourites() async {
      final box = await _getBox();
      return box.values.toList();
    }
   
    void deleteAllFavourites() async {
      final box = await _getBox();
    await  box.clear();
    }
    Future<bool> isFavourite(String id) async {
      final box = await _getBox();
      return box.containsKey(id);
    }

}