import 'package:twitter_client/src/api.dart';

class Geo {
  final TwitterAPI twitter;

  Geo(this.twitter);

  /// Given a latitude and a longitude, searches for up to 20 places that can be used as a place_id when updating a status.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-reverse_geocode
  Future<void> reverseGeocode() async {

  }

  /// Search for places that can be attached to a Tweet via POST statuses/update.
  /// Given a latitude and a longitude pair, an IP address, or a name, this request will return a list of all the valid places that can be used as the place_id when updating a status.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
  Future<void> search() async {

  }

  /// Returns all the information about a known place.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/place-information/api-reference/get-geo-id-place_id
  Future<void> get(String placeID) async {

  }
}