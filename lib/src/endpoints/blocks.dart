import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Blocks {
  final TwitterAPI twitter;

  Blocks(this.twitter);

  /// Returns an array of numeric user ids the authenticating user is blocking.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-ids
  Future<void> ids({
    /// Provide this option to have IDs returned as strings instead.
    bool? stringifyIDs,

    /// Causes the list of IDs to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,
  }) async {
    Map<String, String> params = twitter.createParams({
      'stringify_ids': stringifyIDs,
      'cursor': cursor,
    });

    Response response = await twitter.get("/1.1/blocks/ids.json", params: params);
  }

  /// Returns a collection of user objects that the authenticating user is blocking.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-list
  Future<void> list({
    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true, t or 1 statuses will not be included in the returned user objects.
    bool? skipStatus,

    /// Causes the list of IDs to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,
  }) async {
    Map<String, String> params = twitter.createParams({
      'include_entities': includeEntities,
      'skip_status': skipStatus,
      'cursor': cursor,
    });

    Response response = await twitter.get("/1.1/blocks/list.json", params: params);
  }

  /// Blocks the specified user from following the authenticating user.
  /// In addition the blocked user will not show in the authenticating users mentions or timeline (unless retweeted by another user).
  /// If a follow or friend relationship exists it is destroyed.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-create
  Future<void> create({
    /// The screen name of the potentially blocked user.
    String? screenName,

    /// The ID of the potentially blocked user.
    int? userID,

    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true , t or 1 statuses will not be included in the returned user objects.
    bool? skipStatus,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
      'include_entities': includeEntities,
      'skip_status': skipStatus,
    });

    Response response = await twitter.post("/1.1/blocks/create.json", params: params);
  }

  /// Un-blocks the user specified in the ID parameter for the authenticating user.
  /// Returns the un-blocked user when successful.
  /// If relationships existed before the block was instantiated, they will not be restored.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-destroy
  Future<void> destroy({
    /// The screen name of the potentially blocked user.
    String? screenName,

    /// The ID of the potentially blocked user.
    int? userID,

    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true , t or 1 statuses will not be included in the returned user objects.
    bool? skipStatus,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
      'include_entities': includeEntities,
      'skip_status': skipStatus,
    });

    Response response = await twitter.post("/1.1/blocks/destroy.json", params: params);
  }
}