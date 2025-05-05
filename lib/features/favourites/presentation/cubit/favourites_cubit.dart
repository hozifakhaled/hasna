import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hasna/features/favourites/data/models/favourite_model.dart';
import 'package:hasna/features/favourites/data/repositories/favourite_repositry_Impl.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final FavouriteRepositryImpl repository;
  final Set<String> _favouriteIds = {};

  FavouritesCubit(this.repository) : super(FavouritesInitial()) {
    loadFavourites();
  }

  Future<void> loadFavourites() async {
    try {
      emit(FavouritesLoading());
      final favourites = await repository.getAllFavourites();
      _favouriteIds.clear();
      for (var fav in favourites) {
        _favouriteIds.add(fav.id);
      }
      emit(FavouritesLoaded(favourites));
    } catch (e) {
      emit(FavouritesError(e.toString()));
    }
  }

  Future<void> addToFavourites(FavouriteModel item) async {
    try {
      if (!_favouriteIds.contains(item.id)) {
         repository.addToFavourite(item);
        _favouriteIds.add(item.id);
        await loadFavourites();
      }
    } catch (e) {
      emit(FavouritesError(e.toString()));
    }
  }

  Future<void> removeFromFavourites(String id) async {
    try {
       repository.deleteFromFavourite(id);
      _favouriteIds.remove(id);
      await loadFavourites(); 
    } catch (e) {
      emit(FavouritesError(e.toString()));
    }
  }

  bool isFavourite(String id) => _favouriteIds.contains(id);

  Future<void> cleanEmptyFavourites() async {
    try {
      final allFavourites = await repository.getAllFavourites();
      final emptyFavourites =
          allFavourites.where((item) => item.description.isEmpty).toList();

      for (var item in emptyFavourites) {
         repository.deleteFromFavourite(item.id);
      }
      await loadFavourites(); 
    } catch (e) {
      emit(FavouritesError(e.toString()));
    }
  }
}
