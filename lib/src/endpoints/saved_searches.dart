import 'package:twitter_client/src/api.dart';

class SavedSearches {
  final TwitterAPI twitter;

  SavedSearches(this.twitter);

  /// Returns the authenticated user's saved search queries.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-list
  Future<void> list() async {

  }

  /// Retrieve the information for the saved search represented by the given id.
  /// The authenticating user must be the owner of saved search ID being requested.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-saved_searches-show-id
  Future<void> show(String id) async {

  }

  /// Create a new saved search for the authenticated user.
  /// A user may only have 25 saved searches.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create
  Future<void> create() async {

  }

  /// Destroys a saved search for the authenticating user.
  /// The authenticating user must be the owner of saved search id being destroyed.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-destroy-id
  Future<void> destroy(String id) async {

  }
}