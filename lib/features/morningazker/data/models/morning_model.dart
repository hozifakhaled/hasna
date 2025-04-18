import 'package:hasna/features/morningazker/domain/entities/morningaker_entitiy.dart';

class MorningModel extends MorningakerEntitiy {
  MorningModel({
    required super.id,
    required super.description,
    required super.audioUrl,
    required super.esnadname,
    required super.count,
    required super.totalAzkar,
  });

  factory MorningModel.fromJson(Map<String, dynamic> json) {
    return MorningModel(
      id: json['id'] ?? '',
      description: json['description'] ?? '',
      audioUrl: json['audioUrl'] ?? '',
      esnadname: json['esnadname'] ?? '',
      count: int.tryParse(json['count'].toString()) ?? 1,
      totalAzkar: int.tryParse(json['totalAzkar'].toString()) ?? 0,
    );
  }

  static List<MorningModel> fromJsonList(Map<String, dynamic> json) {
    final azkarList = json['azkar'] as List<dynamic>?;

    if (azkarList == null) return [];

    return azkarList
        .map((item) => MorningModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'audioUrl': audioUrl,
      'esnadname': esnadname,
      'count': count,
      'totalAzkar': totalAzkar,
    };
  }

   

  
}
