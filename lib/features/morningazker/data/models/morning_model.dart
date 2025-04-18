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
      totalAzkar: 0, // هيتم تحديثها بعدين باستخدام copyWith
    );
  }

  static List<MorningModel> fromJsonList(Map<String, dynamic> json) {
    final azkarList = json['azkar'] as List<dynamic>?;
    final totalAzkar = int.tryParse(json['totalAzkar'].toString()) ?? 0;

    if (azkarList == null) return [];

    return azkarList
        .map((item) {
          final parsedItem =
              MorningModel.fromJson(item as Map<String, dynamic>);
          return parsedItem.copyWith(totalAzkar: totalAzkar);
        })
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

  MorningModel copyWith({
    String? id,
    String? description,
    String? audioUrl,
    String? esnadname,
    int? count,
    int? totalAzkar,
  }) {
    return MorningModel(
      id: id ?? this.id,
      description: description ?? this.description,
      audioUrl: audioUrl ?? this.audioUrl,
      esnadname: esnadname ?? this.esnadname,
      count: count ?? this.count,
      totalAzkar: totalAzkar ?? this.totalAzkar,
    );
  }
}
