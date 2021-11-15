import 'package:twitter_client/src/api.dart';

class Feedback {
  final TwitterAPI twitter;

  Feedback(this.twitter);

  /// Returns a single Feedback response for the specified ID in the URL.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/customer-feedback/api-reference/show
  Future<void> show(String id) async {

  }

  /// Returns Feedback creation and response events that occur in a specified time period.
  /// Please note that the max to_time is 24 hours prior to the current time.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/customer-feedback/api-reference/events
  Future<void> events() async {

  }

  /// Sends Feedback prompt along with a Direct Message (DM) to a specified user.
  /// The DM message is required.
  /// Sending Feedback inherits the Direct Message restrictions and behavior from POST direct_messages/events/new.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/customer-feedback/api-reference/create
  Future<void> create() async {

  }
}