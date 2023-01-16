// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

// ignore: public_member_api_docs
class UserDtoAdapter extends TypeAdapter<UserDto> {
  @override
  final int typeId = 1;

  @override
  UserDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDto(
      id: fields[0] as String,
      email: fields[1] as String,
      firstName: fields[2] as String?,
      lastName: fields[3] as String?,
      invitation: fields[4] as String?,
      phone: fields[5] as String?,
      sex: fields[6] as bool?,
      height: fields[7] as double?,
      weight: fields[8] as double?,
      birth: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDto obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.invitation)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.sex)
      ..writeByte(7)
      ..write(obj.height)
      ..writeByte(8)
      ..write(obj.weight)
      ..writeByte(9)
      ..write(obj.birth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      invitation: json['invitation'] as String?,
      phone: json['phone'] as String?,
      sex: json['sex'] as bool?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      birth: json['birth'] as String?,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'invitation': instance.invitation,
      'phone': instance.phone,
      'sex': instance.sex,
      'height': instance.height,
      'weight': instance.weight,
      'birth': instance.birth,
    };
