import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Trends {
  final TwitterAPI twitter;

  Trends(this.twitter);

  /// Returns the locations that Twitter has trending topic information for.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available
  Future<void> available() async {
    Response response = await twitter.get("/1.1/trends/available.json");
  }

  /// Returns the locations that Twitter has trending topic information for, closest to a specified location.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest
  Future<void> closest(
    /// The valid ranges for longitude is -180.0 to +180.0 (West is negative, East is positive) inclusive.
    double lat,

    /// The valid ranges for longitude is -180.0 to +180.0 (West is negative, East is positive) inclusive.
    double long,
  ) async {
    Map<String, String> params = twitter.createParams({
      'lat': lat,
      'long': long
    });

    Response response = await twitter.get("/1.1/trends/closest.json");
  }

  /// Returns the top 50 trending topics for a specific id, if trending information is available for it.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place
  Future<void> place(
    /// The numeric value that represents the location from where to return trending information for from.
    String id,
    {
      /// Setting this equal to hashtags will remove all hashtags from the trends list.
      String? exclude
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'id': id,
      'exclude': exclude,
    });

    Response response = await twitter.get("/1.1/trends/place.json", params: params);
  }
}