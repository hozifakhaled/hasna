// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasabih_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasabihModelAdapter extends TypeAdapter<TasabihModel> {
  @override
  final int typeId = 0;

  @override
  TasabihModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasabihModel(
      taxt: fields[0] as String,
      number: fields[1] as int,
      id: fields[2] as int,
      sumNumber: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TasabihModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.taxt)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.sumNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasabihModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
