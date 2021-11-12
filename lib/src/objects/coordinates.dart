/// Coordinates object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/geo
class Coordinates {
  /// The longitude and latitude of the Tweet’s location, as a collection in the form [longitude, latitude].
  List<double> coordinates;

  /// The type of data encoded in the coordinates property.
  String type;

  Coordinates(
    this.coordinates,
    this.type,
  );

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    json['coordinates'],
    json['type'],
  );
}