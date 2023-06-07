import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? proizvodId;
  String? naziv;
  String? sifra;
  double? cijena;
  String? slika;
  int? vrstaId;
  int? jedinicaMjereId;
  Product(this.proizvodId, this.naziv, this.sifra, this.cijena, this.slika, this.vrstaId, this.jedinicaMjereId);

    /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}


// {
//       "proizvodId": 0,
//       "naziv": "string",
//       "sifra": "string",
//       "cijena": 0,
//       "vrstaId": 0,
//       "jedinicaMjereId": 0,
//       "slika": "string",
//       "slikaThumb": "string",
//       "status": true,
//       "stateMachine": "string"
//     }