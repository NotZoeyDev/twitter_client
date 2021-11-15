import 'package:twitter_client/twitter.dart';

class Lists {
  final TwitterAPI twitter;
  late final ListsMembers members;

  Lists(this.twitter) {
    this.members = ListsMembers(twitter);
  }

  /// Returns all lists the authenticating or specified user subscribes to, including their own.
  /// The user is specified using the user_id or screen_name parameters.
  /// If no user is given, the authenticating user is used.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list
  Future<void> list() async {

  }

  /// Returns the lists the specified user has been added to.
  /// If user_id or screen_name are not provided, the memberships for the authenticating user are returned.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships
  Future<void> memberships() async {

  }

  /// Returns the lists owned by the specified Twitter user.
  /// Private lists will only be shown if the authenticated user is also the owner of the lists.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships
  Future<void> owernships() async {

  }

  /// Returns the specified list.
  /// Private lists will only be shown if the authenticated user owns the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show
  Future<void> show() async {

  }

  /// Returns a timeline of tweets authored by members of the specified list.
  /// Retweets are included by default.
  /// Use the `include_rts=false` parameter to omit retweets.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses
  Future<void> statuses() async {

  }

  /// Obtain a collection of the lists the specified user is subscribed to, 20 lists per page by default.
  /// Does not include the user's own lists.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions
  Future<void> subscriptions() async {

  }

  /// Creates a new list for the authenticated user.
  /// Note that you can create up to 1000 lists per account.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create
  Future<void> create() async {

  }

  /// Deletes the specified list.
  /// The authenticated user must own the list to be able to destroy it.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy
  Future<void> destroy() async {

  }

  /// Updates the specified list. The authenticated user must own the list to be able to update it.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update
  Future<void> update() async {

  }
}

class ListsMembers {
  final TwitterAPI twitter;

  ListsMembers(this.twitter);

  /// Returns the members of the specified list.
  /// Private list members will only be shown if the authenticated user owns the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members
  Future<void> list() async {

  }

  /// Check if the specified user is a member of the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members-show
  Future<void> show() async {

  }

  /// Add a member to a list.
  /// The authenticated user must own the list to be able to add members to it.
  /// Note that lists cannot have more than 5,000 members.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create
  Future<void> create() async {

  }

  /// Adds multiple members to a list, by specifying a comma-separated list of member ids or screen names.
  /// The authenticated user must own the list to be able to add members to it.
  /// Note that lists can't have more than 5,000 members, and you are limited to adding up to 100 members to a list at a time with this method.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all
  Future<void> createAll() async {

  }

  /// Removes the specified member from the list.
  /// The authenticated user must be the list's owner to remove members from the list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy
  Future<void> destroy() async {

  }

  /// Removes multiple members from a list, by specifying a comma-separated list of member ids or screen names.
  /// The authenticated user must own the list to be able to remove members from it.
  /// Note that lists can't have more than 500 members, and you are limited to removing up to 100 members to a list at a time with this method.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all
  Future<void> destroyAll() async {

  }
}

class ListsSubscribers {
  final TwitterAPI twitter;

  ListsSubscribers(this.twitter);

  /// Returns the subscribers of the specified list.
  /// Private list subscribers will only be shown if the authenticated user owns the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers
  Future<void> list() async {

  }

  /// Check if the specified user is a subscriber of the specified list.
  /// Returns the user if they are a subscriber.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show
  Future<void> show() async {

  }

  /// Subscribes the authenticated user to the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-create
  Future<void> create() async {

  }

  /// Unsubscribes the authenticated user from the specified list.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy
  Future<void> destroy() async {

  }
}