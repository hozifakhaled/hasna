import 'package:hasna/features/prayerstimers/domain/entities/prayers_timers_entity.dart';

class PrayersTimersModel extends PrayersTimersEntity {
  final String? id;

  PrayersTimersModel({
    this.id,
    super.fajr,
    super.dhuhr,
    super.asr,
    super.maghrib,
    super.isha,
    super.previousPrayer,
    super.nextPrayer,
    super.hijri,
  });

  factory PrayersTimersModel.fromJson(Map<String, dynamic> json) {
    final azkar = json['azkar'] ?? {};
    final prev = json['previousPrayer'] ?? {};
    final next = json['nextPrayer'] ?? {};

    return PrayersTimersModel(
      hijri: Datehijri(
        weekday: json['hijri']['weekday'],
        day: json['hijri']['day'],
        month: json['hijri']['month'],
        year: json['hijri']['year'],
      ),
      id: json['id'],
      fajr: azkar['fajr'],
      dhuhr: azkar['dhuhr'],
      asr: azkar['asr'],
      maghrib: azkar['maghrib'],
      isha: azkar['isha'],
      previousPrayer: PrayerInfo(
        name: prev['name'],
        time: prev['time'],
      ),
      nextPrayer: PrayerInfo(
        name: next['name'],
        time: next['time'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "azkar": {
        "fajr": fajr,
        "dhuhr": dhuhr,
        "asr": asr,
        "maghrib": maghrib,
        "isha": isha,
      },
      "previousPrayer": {
        "name": previousPrayer?.name,
        "time": previousPrayer?.time,
      },
      "nextPrayer": {
        "name": nextPrayer?.name,
        "time": nextPrayer?.time,
      },
      "hijri": {
        "weekday": hijri?.weekday,
        "day": hijri?.day,
        "month": hijri?.month,
        "year": hijri?.year,
      },
    };
  }
}
