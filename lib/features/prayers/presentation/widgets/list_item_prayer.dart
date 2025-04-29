import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasna/features/prayers/presentation/cubit/prayers_cubit.dart';
import 'package:hasna/features/prayers/presentation/widgets/prayer_item.dart';
import 'package:hasna/features/prayers/presentation/widgets/separtor_prayers.dart';

class ListItemPrayer extends StatelessWidget {
  const ListItemPrayer({super.key});
@override
  
  Widget build(BuildContext context) {
    return BlocBuilder<PrayersCubit, PrayersState>(
      builder: (context, state) {
   if (state is PrayersLoaded) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          itemCount:state. prayersList.length,
          separatorBuilder:
              (context, index) => Separatorprayers(
                text: state.prayersList[index].souraname ?? 'لا يوجد وصف',
              ),
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: PrayerItem(
                  text: state.prayersList[index].description ?? 'لا يوجد اسم',
                ),
              ),
                  );
    
   }else if (state is PrayersError) {
                      return Center(
                        child: Text(state.errorMessage),
                      );
                    } else {
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    }
   
     },
    );
  }
}
