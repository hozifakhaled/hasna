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

  factory MorningModel.fromJson( json) {
    final zekr = json['zekr'];

    return MorningModel(
      id: zekr['id'] as String,
      description: zekr['description'] as String,
      audioUrl: zekr['audioUrl'] as String,
      esnadname: zekr['esnadname'] as String,
      count: zekr['count'] as int,
      totalAzkar: json['totalAzkar'] as int,
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
