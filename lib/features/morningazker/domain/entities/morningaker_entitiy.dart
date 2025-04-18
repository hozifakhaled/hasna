class MorningakerEntitiy {
  final String id;
  final String description;
  final String audioUrl;
  final String esnadname;
  final int count;
  final int totalAzkar;

  const MorningakerEntitiy({
    required this.id,
    required this.description,
    required this.audioUrl,
    required this.esnadname,
    required this.count,
    required this.totalAzkar,
  });

  // ✅ أضف copyWith هنا
  MorningakerEntitiy copyWith({
    String? id,
    String? description,
    String? audioUrl,
    String? esnadname,
    int? count,
    int? totalAzkar,
  }) {
    return MorningakerEntitiy(
      id: id ?? this.id,
      description: description ?? this.description,
      audioUrl: audioUrl ?? this.audioUrl,
      esnadname: esnadname ?? this.esnadname,
      count: count ?? this.count,
      totalAzkar: totalAzkar ?? this.totalAzkar,
    );
  }
}
