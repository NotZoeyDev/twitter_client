import 'package:http/http.dart';
import 'package:twitter_client/twitter.dart';

class Favorites {
  final TwitterAPI twitter;

  Favorites(this.twitter);

  /// Favorites (likes) the Tweet specified in the ID parameter as the authenticating user.
  /// Returns the favorite Tweet when successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-create
  Future<void> create(
    // The numerical ID of the Tweet to like.
    String id,
    {
      /// The entities node will be omitted when set to false.
      bool? includeEntities,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'id': id,
      'include_entities': includeEntities,
    });

    Response response = await twitter.post("/1.1/favorites/create.json", params: params);
  }

  /// Unfavorites (un-likes) the Tweet specified in the ID parameter as the authenticating user.
  /// Returns the un-liked Tweet when successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-favorites-destroy
  Future<void> destroy(
    // The numerical ID of the Tweet to like.
    String id,
    {
      /// The entities node will be omitted when set to false.
      bool? includeEntities,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'id': id,
      'include_entities': includeEntities,
    });

    Response response = await twitter.post("/1.1/favorites/destroy.json", params: params);
  }

  /// Returns the 20 most recent Tweets liked by the authenticating or specified user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-favorites-list
  Future<void> list({
    /// The ID of the user for whom to return results.
    int? userID,

    /// The screen name of the user for whom to return results.
    String? screenName,

    /// Specifies the number of records to retrieve. Must be less than or equal to 200; defaults to 20.
    int? count,

    /// Returns results with an ID greater than (that is, more recent than) the specified ID.
    int? sinceID,

    /// Returns results with an ID less than (that is, older than) or equal to the specified ID.
    int? maxID,

    /// The entities node will be omitted when set to false.
    bool? includeEntities,
  }) async {
    Map<String, String> params = twitter.createParams({
      'user_id': userID,
      'screen_name': screenName,
      'count': count,
      'sincde_id': sinceID,
      'max_id': maxID,
      'include_entities': includeEntities,
    });

    Response response = await twitter.get("/1.1/favorites/list.json", params: params);
  }
}