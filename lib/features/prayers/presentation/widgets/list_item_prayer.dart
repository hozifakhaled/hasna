import 'package:flutter/widgets.dart';
import 'package:hasna/features/prayers/domain/entities/prayers_entitity.dart';
import 'package:hasna/features/prayers/presentation/widgets/prayer_item.dart';
import 'package:hasna/features/prayers/presentation/widgets/separtor_prayers.dart';

class ListItemPrayer extends StatelessWidget {
  const ListItemPrayer({
    super.key, required this.prayersList,
  });
  
  final List<PrayersEntitiy> prayersList ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: prayersList.length,
        separatorBuilder: (context, index) =>
             Separatorprayers(text:prayersList[index].souraname??'لا يوجد وصف'),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical:  8.0),
          child: PrayerItem(
            text: prayersList[index].description ?? 'لا يوجد اسم',
          ),
        ),
      ),
    );
  }
}


