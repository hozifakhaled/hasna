class PrayersTimersEntity {
  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final PrayerInfo? previousPrayer;
  final PrayerInfo? nextPrayer;
 final Datehijri? hijri;
  PrayersTimersEntity( {
    this.hijri,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.previousPrayer,
    this.nextPrayer,
  });
}

class PrayerInfo {
  final String? name;
  final String? time;

  PrayerInfo({this.name, this.time});
}

class Datehijri {
  final String? weekday;
  final String? day;
  final String? month;
final String? year;
  Datehijri({this.weekday, this.day, this.month, this.year});
}
