import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Mutes {
  final TwitterAPI twitter;
  late final MutesUsers users;

  Mutes(this.twitter) {
    this.users = new MutesUsers(twitter);
  }
}

class MutesUsers {
  final TwitterAPI twitter;

  MutesUsers(this.twitter);

  /// Returns an array of numeric user ids the authenticating user has muted.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids
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

    Response response = await twitter.get("/1.1/mutes/users/ids.json", params: params);
  }

  /// Returns an array of user objects the authenticating user has muted.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list
  Future<void> list({
    /// Causes the list of IDs to be broken into pages of no more than 5000 IDs at a time.
    int? cursor,

    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true, t or 1, statuses will not be included in the returned user objects.
    bool? skipStatus,
  }) async {
    Map<String, String> params = twitter.createParams({
      'cursor': cursor,
      'include_entities': includeEntities,
      'skip_status': skipStatus,
    });

    Response response = await twitter.get("/1.1/mutes/users/list.json", params: params);
  }

  /// Mutes the user specified in the ID parameter for the authenticating user.
  /// Returns the muted user when successful.
  /// Returns a string describing the failure condition when unsuccessful.
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-create
  Future<void> create({
    /// The screen name of the potentially muted user.
    String? screenName,

    /// The ID of the potentially muted user.
    int? userID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
    });

    Response response = await twitter.post("/1.1/mutes/users/create.json", params: params);
  }

  /// Un-mutes the user specified in the ID parameter for the authenticating user. 
  /// Returns the unmuted user when successful.
  /// Returns a string describing the failure condition when unsuccessful. 
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-destroy
  Future<void> destroy({
    /// The screen name of the potentially muted user.
    String? screenName,

    /// The ID of the potentially muted user.
    int? userID,
  }) async {
    Map<String, String> params = twitter.createParams({
      'screen_name': screenName,
      'user_id': userID,
    });

    Response response = await twitter.post("/1.1/mutes/users/destroy.json", params: params);
  }
}