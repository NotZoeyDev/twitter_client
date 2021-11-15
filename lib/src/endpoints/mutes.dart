import 'package:twitter_client/src/api.dart';

class Mute {
  final TwitterAPI twitter;

  Mute(this.twitter);

  /// Returns an array of numeric user ids the authenticating user has muted.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-ids
  Future<void> usersIDs() async {

  }

  /// Returns an array of user objects the authenticating user has muted.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list
  Future<void> usersList() async {

  }

  /// Mutes the user specified in the ID parameter for the authenticating user.
  /// Returns the muted user when successful.
  /// Returns a string describing the failure condition when unsuccessful.
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-create
  Future<void> usersCreate() async {

  }

  /// Un-mutes the user specified in the ID parameter for the authenticating user. 
  /// Returns the unmuted user when successful.
  /// Returns a string describing the failure condition when unsuccessful. 
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-destroy
  Future<void> usersDestroy() async {

  }
}