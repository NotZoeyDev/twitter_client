import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Geo {
  final TwitterAPI twitter;

  Geo(this.twitter);

  /// Given a latitude and a longitude, searches for up to 20 places that can be used as a place_id when updating a status.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-reverse_geocode
  Future<void> reverseGeocode({
    /// The latitude to search around.
    double? lat,

    /// The longitude to search around.
    double? long,

    /// A hint on the "region" in which to search.
    String? accuracy,

    /// This is the minimal granularity of place types to return and must be one of: neighborhood, city, admin or country.
    String? granularity,

    /// A hint as to the number of results to return.
    int? maxResults,
  }) async {
    Map<String, String> params = twitter.createParams({
      'lat': lat,
      'long': long,
      'accuracy': accuracy,
      'granularity': granularity,
      'max_results': maxResults
    });

    Response response = await twitter.get("/1.1/geo/reverse_geocode.json", params: params);
  }

  /// Search for places that can be attached to a Tweet via POST statuses/update.
  /// Given a latitude and a longitude pair, an IP address, or a name, this request will return a list of all the valid places that can be used as the place_id when updating a status.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/places-near-location/api-reference/get-geo-search
  Future<void> search({
    /// The latitude to search around.
    double? lat,

    /// The longitude to search around.
    double? long,

    /// Free-form text to match against while executing a geo-based query, best suited for finding nearby locations by name.
    String? query,

    /// An IP address.
    String? ip,

    /// This is the minimal granularity of place types to return and must be one of: neighborhood, city, admin or country.
    String? granularity,

    /// A hint as to the number of results to return.
    int? maxResults,
  }) async {
    Map<String, String> params = twitter.createParams({
      'lat': lat,
      'long': long,
      'query': query,
      'ip': ip,
      'granularity': granularity,
      'max_results': maxResults
    });

    Response response = await twitter.get("/1.1/geo/search.json", params: params);
  }

  /// Returns all the information about a known place.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/geo/place-information/api-reference/get-geo-id-place_id
  Future<void> get(
    String placeID
  ) async {
    Response response = await twitter.get("/1.1/geo/id/$placeID.json");
  }
}