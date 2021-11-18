import 'bounding_box.dart';

/// Place object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/geo
class Place {
  /// ID representing this place. Note that this is represented as a string, not an integer.
  String id;

  /// URL representing the location of additional place metadata for this place.
  String url;

  /// The type of location represented by this place.
  String placeType;

  /// Short human-readable representation of the place’s name.
  String name;

  /// Full human-readable representation of the place’s name.
  String fullName;

  /// Shortened country code representing the country containing this place.
  String countryCode;

  /// Name of the country containing this place.
  String country;

  /// A bounding box of coordinates which encloses this place.
  BoundingBox boundingBox;

  Place(
    this.id,
    this.url,
    this.placeType,
    this.name,
    this.fullName,
    this.countryCode,
    this.country,
    this.boundingBox,
  );

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    json['id'],
    json['url'],
    json['place_type'],
    json['name'],
    json['full_name'],
    json['country_code'],
    json['country'],
    BoundingBox.fromJson(json['bounding_box']),
  );
}