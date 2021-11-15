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
  Future<void> get() async {

  }

  /// Returns an array of user objects the authenticating user has muted.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-mutes-users-list
  Future<void> list() async {

  }

  /// Mutes the user specified in the ID parameter for the authenticating user.
  /// Returns the muted user when successful.
  /// Returns a string describing the failure condition when unsuccessful.
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-create
  Future<void> create() async {

  }

  /// Un-mutes the user specified in the ID parameter for the authenticating user. 
  /// Returns the unmuted user when successful.
  /// Returns a string describing the failure condition when unsuccessful. 
  /// Actions taken in this method are asynchronous.
  /// Changes will be eventually consistent.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-mutes-users-destroy
  Future<void> destroy() async {

  }

}