import 'package:twitter_client/src/api.dart';

class Blocks {
  final TwitterAPI twitter;

  Blocks(this.twitter);

  /// Returns an array of numeric user ids the authenticating user is blocking.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-ids
  Future<void> ids() async {

  }

  /// Returns a collection of user objects that the authenticating user is blocking.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/get-blocks-list
  Future<void> list() async {

  }

  /// Blocks the specified user from following the authenticating user.
  /// In addition the blocked user will not show in the authenticating users mentions or timeline (unless retweeted by another user).
  /// If a follow or friend relationship exists it is destroyed.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-create
  Future<void> create() async {

  }

  /// Un-blocks the user specified in the ID parameter for the authenticating user.
  /// Returns the un-blocked user when successful.
  /// If relationships existed before the block was instantiated, they will not be restored.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-blocks-destroy
  Future<void> destroy() async {

  }
}