import 'package:hasna/features/eveningazker/domain/entities/eveningaker_entitiy.dart';

class EveningModel extends EveningakerEntitiy {
  EveningModel({
    required super.id,
    required super.description,
    required super.audioUrl,
    required super.esnadname,
    required super.count,
   
  });

  factory EveningModel.fromJson(Map<String, dynamic> json) {
  
    return EveningModel(
      id: json['id'] as String,
      description: json['description'] as String,
      audioUrl: json['audioUrl'] as String,
      esnadname: json['esnadname'] as String,
      count: json['count'] as int,
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'audioUrl': audioUrl,
      'esnadname': esnadname,
      'count': count,
      
    };
  }
}
