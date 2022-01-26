// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hlp_caching_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachingAdapter extends TypeAdapter<CachingModel> {
  @override
  final int typeId = 0;

  @override
  CachingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachingModel(
      url: fields[0] as String,
      response: fields[1] as String,
      cachingDate: fields[2] as DateTime,
      expireDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CachingModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.response)
      ..writeByte(2)
      ..write(obj.cachingDate)
      ..writeByte(3)
      ..write(obj.expireDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
