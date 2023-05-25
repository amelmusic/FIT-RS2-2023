// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['proizvodId'] as int?,
      json['naziv'] as String?,
      json['sifra'] as String?,
      (json['cijena'] as num?)?.toDouble(),
      json['slika'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'proizvodId': instance.proizvodId,
      'naziv': instance.naziv,
      'sifra': instance.sifra,
      'cijena': instance.cijena,
      'slika': instance.slika,
    };
