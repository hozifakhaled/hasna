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
    final zekr = json['zekr'];

    return MorningModel(
      id: zekr['id'].toString(),
      description: zekr['description'] ?? '',
      audioUrl: zekr['audioUrl'] ?? '',
      esnadname: zekr['esnadname'] ?? '',
      count: zekr['count'] ?? 1,
      totalAzkar: json['totalAzkar'] ?? 0,
    );
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
