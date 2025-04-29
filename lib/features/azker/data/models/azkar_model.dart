import 'package:hasna/features/azker/domain/entities/aker_entitiy.dart';

class AzkerModel extends AkerEntitiy {
  AzkerModel({
    required super.id,
    required super.description,
    required super.audioUrl,
    required super.esnadname,
    required super.count,
   
  });

  factory AzkerModel.fromJson(Map<String, dynamic> json) {
  
    return AzkerModel(
      id: json['id'] ??1,
      description: json['description'] as String,
      audioUrl: json['audioUrl']??"",
      esnadname: json['esnadname'] ??'',
      count: json['count']??0,
    
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
