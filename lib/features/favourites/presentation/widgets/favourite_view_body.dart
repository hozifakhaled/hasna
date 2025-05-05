import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/core/themeing/colors.dart';
import 'package:hasna/core/widgets/custom_appbar1.dart';
import 'package:hasna/features/favourites/presentation/cubit/favourites_cubit.dart';
import 'package:hasna/features/favourites/presentation/widgets/zekr_in_favourite.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<FavouritesCubit>();
      cubit.cleanEmptyFavourites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar1(title: 'المفضلة'),
            Expanded(
              child: BlocBuilder<FavouritesCubit, FavouritesState>(
                builder: (context, state) {
                  if (state is FavouritesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is FavouritesError) {
                    return Center(child: Text('خطأ: ${state.message}'));
                  }
                  if (state is FavouritesLoaded) {
                    final favourites = state.favourites
                        .where((item) => item.description.isNotEmpty)
                        .toList();
                    if (favourites.isEmpty) {
                      return _buildEmptyFavouritesView();
                    }
                    return _buildFavouritesList(favourites);
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavouritesList(List favourites) {
    return ListView.builder(
      itemCount: favourites.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final item = favourites[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ZekrInFavourite(
            zekr: item.description,
            onRemove: () {
              context.read<FavouritesCubit>().removeFromFavourites(item.id);
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyFavouritesView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 80,
            color: AppColors.thirdcolor.withOpacity(0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'لا يوجد عناصر مفضلة',
            style: TextStyle(
              fontSize: 22,
              color: AppColors.thirdcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'يمكنك إضافة الأذكار إلى المفضلة\nلتسهيل الوصول إليها لاحقاً',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.thirdcolor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
