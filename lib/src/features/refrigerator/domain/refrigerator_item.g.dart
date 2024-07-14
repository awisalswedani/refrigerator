// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refrigerator_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefrigeratorItemImpl _$$RefrigeratorItemImplFromJson(
        Map<String, dynamic> json) =>
    _$RefrigeratorItemImpl(
      id: json['id'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      quantity: (json['quantity'] as num).toInt(),
      unit: (json['unit'] as num).toInt(),
      marketName: json['marketName'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$RefrigeratorItemImplToJson(
        _$RefrigeratorItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'expirationDate': instance.expirationDate.toIso8601String(),
      'quantity': instance.quantity,
      'unit': instance.unit,
      'marketName': instance.marketName,
      'notes': instance.notes,
    };
