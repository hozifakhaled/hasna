import 'package:hasna/features/prayers/domain/entities/prayers_entitity.dart';

class PrayersModel extends PrayersEntitiy{
  PrayersModel({
     super.id,
     super.description,
     super.souraname,
  });
  factory PrayersModel.fromJson(Map<String, dynamic> json) {
    return PrayersModel(
      id: json['id'] ??1,
      description: json['description']?? "",
      souraname: json['souraname'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'souraname': souraname,
    };
  }
}