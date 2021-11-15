import 'package:twitter_client/src/api.dart';

class Collections {
  final TwitterAPI twitter;
  late final CollectionsEntries entries;

  Collections(this.twitter) {
    this.entries = new CollectionsEntries(twitter);
  }

  /// Find Collections created by a specific user or containing a specific curated Tweet.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-list
  Future<void> list() async {

  }

  /// Retrieve information associated with a specific Collection.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-show
  Future<void> show() async {

  }

  /// Create a Collection owned by the currently authenticated user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-create
  Future<void> create() async {

  }

  /// Permanently delete a Collection owned by the currently authenticated user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-destroy
  Future<void> destroy() async {

  }

  /// Update information concerning a Collection owned by the currently authenticated user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-update
  Future<void> update() async {

  }
}

class CollectionsEntries {
  final TwitterAPI twitter;

  CollectionsEntries(this.twitter);

  /// Retrieve the identified Collection, presented as a list of the Tweets curated within.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/get-collections-entries
  Future<void> list() async {

  }

  /// Add a specified Tweet to a Collection.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-add
  Future<void> add() async {

  }

  /// Curate a Collection by adding or removing Tweets in bulk. Updates must be limited to 100 cumulative additions or removals per request.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-curate
  Future<void> curate() async {

  }

  /// Move a specified Tweet to a new position in a curation_reverse_chron ordered collection.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-move
  Future<void> move() async {

  }

  /// Remove the specified Tweet from a Collection.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/curate-a-collection/api-reference/post-collections-entries-remove
  Future<void> remove() async {

  }
}