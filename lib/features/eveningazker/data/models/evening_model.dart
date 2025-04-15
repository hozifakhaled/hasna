import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';

class EveningModel extends EveningakerEntitiy {
  EveningModel({
    required super.id,
    required super.description,
    required super.audioUrl,
    required super.esnadname,
    required super.count,
    required super.totalAzkar,
  });

  factory EveningModel.fromJson( json) {
    final zekr = json['zekr'];

    return EveningModel(
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
