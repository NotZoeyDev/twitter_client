/// Bounding box Object
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/geo
class BoundingBox {
  /// A series of longitude and latitude points, defining a box which will contain the Place entity this bounding box is related to.
  List<List<List<double>>> coordinates;

  /// The type of data encoded in the coordinates property.
  String type;

  BoundingBox(
    this.coordinates,
    this.type
  );

  factory BoundingBox.fromJson(Map<String, dynamic> json) => BoundingBox(
    json['coordinates'].cast<List<List<List<double>>>>(),
    json['type'],
  );
}