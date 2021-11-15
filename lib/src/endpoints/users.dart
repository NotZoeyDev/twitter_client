import 'package:twitter_client/src/api.dart';

class Users {
  final TwitterAPI twitter;

  Users(this.twitter);

  /// Returns fully-hydrated user objects for up to 100 users per request, as specified by comma-separated values passed to the user_id and/or screen_name parameters.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup
  Future<void> lookup() async {

  }

  /// Provides a simple, relevance-based search interface to public user accounts on Twitter.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-search
  Future<void> search() async {

  }

  /// Returns a variety of information about the user specified by the required user_id or screen_name parameter.
  /// The author's most recent Tweet will be returned inline when possible.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-users-show
  Future<void> show() async {

  }

  /// Report the specified user as a spam account to Twitter.
  /// Additionally, optionally performs the equivalent of POST blocks/create on behalf of the authenticated user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/mute-block-report-users/api-reference/post-users-report_spam
  Future<void> reportSpam() async {

  }
}