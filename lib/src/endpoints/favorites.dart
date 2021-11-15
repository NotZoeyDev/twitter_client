import 'package:twitter_client/twitter.dart';

class Favorites {
  final TwitterAPI twitter;

  Favorites(this.twitter);

  /// Favorites (likes) the Tweet specified in the ID parameter as the authenticating user.
  /// Returns the favorite Tweet when successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-create
  Future<void> create() async {

  }

  /// Unfavorites (un-likes) the Tweet specified in the ID parameter as the authenticating user.
  /// Returns the un-liked Tweet when successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
  Future<void> destroy() async {

  }

  /// Returns the 20 most recent Tweets liked by the authenticating or specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
  Future<void> list() async {

  }
}