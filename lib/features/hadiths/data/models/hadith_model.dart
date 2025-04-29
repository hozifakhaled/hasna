import 'package:hasna/features/hadiths/domain/entities/hadith_entity.dart';

class HadithModel extends HadithEntity {
  HadithModel({
    required super.id,
    required super.hadith,
    required super.importance,
    required super.fiqh,
    required super.audioUrl,
  });

  // الخيار 1: تعديل fromJson لتتوافق مع toJson
  factory HadithModel.fromJson(Map<String, dynamic> json) {
    // التحقق مما إذا كانت البيانات داخل حقل 'hadith' أو في الجذر
    if (json.containsKey('hadith') && json['hadith'] is Map<String, dynamic>) {
      // البيانات داخل حقل 'hadith'
      var hadithData = json['hadith'] as Map<String, dynamic>;
      
      // تحويل ID إلى int بأمان
      int idValue;
      if (hadithData['id'] is String) {
        idValue = int.tryParse(hadithData['id']) ?? 0;
      } else {
        idValue = hadithData['id'] as int? ?? 0;
      }
      
      return HadithModel(
        id: idValue,
        hadith: hadithData['hadith'] as String? ?? '',
        importance: hadithData['importance'] as String? ?? '',
        fiqh: hadithData['fiqh'] as String? ?? '',
        audioUrl: hadithData['audioUrl'] as String? ?? '',
      );
    } else {
      // البيانات في الجذر
      // تحويل ID إلى int بأمان
      int idValue;
      if (json['id'] is String) {
        idValue = int.tryParse(json['id']) ?? 0;
      } else {
        idValue = json['id'] as int? ?? 0;
      }
      
      return HadithModel(
        id: idValue,
        hadith: json['hadith'] as String? ?? '',
        importance: json['importance'] as String? ?? '',
        fiqh: json['fiqh'] as String? ?? '',
        audioUrl: json['audioUrl'] as String? ?? '',
      );
    }
  }

  // الخيار 2: تعديل toJson لتتوافق مع fromJson
  // اختر إما هذه الطريقة أو الطريقة الأصلية، ليس كلاهما
  /*
  Map<String, dynamic> toJson() {
    return {
      'hadith': {
        'id': id,
        'hadith': hadith,
        'importance': importance,
        'fiqh': fiqh,
        'audioUrl': audioUrl,
      }
    };
  }
  */
  
  // الطريقة الأصلية لـ toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hadith': hadith,
      'importance': importance,
      'fiqh': fiqh,
      'audioUrl': audioUrl,
    };
  }
}