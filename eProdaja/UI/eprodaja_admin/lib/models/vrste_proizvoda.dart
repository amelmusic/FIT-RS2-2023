
import 'package:json_annotation/json_annotation.dart';

part 'vrste_proizvoda.g.dart';


@JsonSerializable()
class VrsteProizvoda {
  int? vrstaId;
  String? naziv;

  VrsteProizvoda(this.vrstaId, this.naziv);

    /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory VrsteProizvoda.fromJson(Map<String, dynamic> json) => _$VrsteProizvodaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$VrsteProizvodaToJson(this);
}