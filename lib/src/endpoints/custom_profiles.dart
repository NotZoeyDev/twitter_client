import 'package:twitter_client/src/api.dart';

class CustomProfiles {
  final TwitterAPI twitter;

  CustomProfiles(this.twitter);

  /// Creates a new custom profile.
  /// The returned ID should be used with when publishing a new message with POST direct_messages/events/new.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/custom-profiles/api-reference/new-profile
  Future<void> create() async {

  }

  /// Retrieves all custom profiles for the authenticated account.
  /// Default page size is 20.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/custom-profiles/api-reference/get-profile-list
  Future<void> list() async {

  }

  /// Returns a custom profile that was created with POST custom_profiles/new.json.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/custom-profiles/api-reference/get-profile
  Future<void> get(String id) async {

  }

  /// Deletes a custom profile that was created with POST custom_profiles/new.json.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/custom-profiles/api-reference/delete-profile
  Future<void> destroy() async {

  }
}