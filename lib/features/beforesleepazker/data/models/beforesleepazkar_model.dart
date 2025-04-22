import 'package:hasna/features/beforesleepazker/domain/entities/beforesleepazkar_entitiy.dart';

class BeforesleepazkarModel  extends BeforesleepazkarEntitiy {
  BeforesleepazkarModel({
    required super.id,
    required super.description,
    required super.audioUrl,
    required super.esnadname,
    required super.count,
   
  });

  factory BeforesleepazkarModel.fromJson(Map<String, dynamic> json) {
  
    return BeforesleepazkarModel(
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
