// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_apod_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NasaApodModelAdapter extends TypeAdapter<NasaApodModel> {
  @override
  final int typeId = 0;

  @override
  NasaApodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NasaApodModel(
      copyright: fields[0] as String?,
      date: fields[1] as DateTime?,
      explanation: fields[2] as String?,
      mediaType: fields[3] as String?,
      serviceVersion: fields[4] as String?,
      title: fields[5] as String?,
      url: fields[6] as String?,
      imageFile: fields[7] as File?,
    );
  }

  @override
  void write(BinaryWriter writer, NasaApodModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.copyright)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.explanation)
      ..writeByte(3)
      ..write(obj.mediaType)
      ..writeByte(4)
      ..write(obj.serviceVersion)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.url)
      ..writeByte(7)
      ..write(obj.imageFile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NasaApodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
