import 'package:twitter_client/src/api.dart';

class Trends {
  final TwitterAPI twitter;

  Trends(this.twitter);

  /// Returns the locations that Twitter has trending topic information for.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available
  Future<void> available() async {

  }

  /// Returns the locations that Twitter has trending topic information for, closest to a specified location.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest
  Future<void> closest() async {

  }

  /// Returns the top 50 trending topics for a specific id, if trending information is available for it.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place
  Future<void> place(String id, { String? exlucde }) async {

  }
}