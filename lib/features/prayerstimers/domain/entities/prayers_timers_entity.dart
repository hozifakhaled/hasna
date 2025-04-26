class PrayersTimersEntity {
  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final PrayerInfo? previousPrayer;
  final PrayerInfo? nextPrayer;

  PrayersTimersEntity({
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
