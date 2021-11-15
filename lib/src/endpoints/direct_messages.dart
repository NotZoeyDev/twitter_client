import 'package:twitter_client/src/api.dart';

class DirectMessages {
  final TwitterAPI twitter;
  late final DirectMessagesEvents events;
  late final DirectMessagesWelcomeMessages welcomeMessages;

  DirectMessages(this.twitter) {
    this.events = new DirectMessagesEvents(this.twitter);
    this.welcomeMessages = new DirectMessagesWelcomeMessages(this.twitter);
  }

  /// Marks a message as read in the recipient’s Direct Message conversation view with the sender.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/typing-indicator-and-read-receipts/api-reference/new-read-receipt
  Future<void> markRead() async {

  }

  /// Displays a visual typing indicator in the recipient’s Direct Message conversation view with the sender.
  /// Each request triggers a typing indicator animation with a duration of ~3 seconds.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/typing-indicator-and-read-receipts/api-reference/new-typing-indicator
  Future<void> indicateTyping() async {

  }
}

class DirectMessagesEvents {
  final TwitterAPI twitter;

  DirectMessagesEvents(this.twitter);

  /// Publishes a new message_create event resulting in a Direct Message sent to a specified user from the authenticating user.
  /// Returns an event if successful.
  /// Supports publishing Direct Messages with optional Quick Reply and media attachment.
  /// Replaces behavior currently provided by POST direct_messages/new.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/new-event
  Future<void> create() async {

  }

  /// Returns a single Direct Message event by the given id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/get-event
  Future<void> show() async {

  }

  /// Returns all Direct Message events (both sent and received) within the last 30 days. Sorted in reverse-chronological order.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/list-events
  Future<void> list() async {

  }

  /// Deletes the direct message specified in the required ID parameter.
  /// The authenticating user must be the recipient of the specified direct message.
  /// Direct Messages are only removed from the interface of the user context provided.
  /// Other members of the conversation can still access the Direct Messages.
  /// A successful delete will return a 204 http response code with no body content.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/sending-and-receiving/api-reference/delete-message-event
  Future<void> destroy() async {

  }
}

class DirectMessagesWelcomeMessages {
  final TwitterAPI twitter;
  late final DirectMessagesWelcomeMessagesRules rules;

  DirectMessagesWelcomeMessages(this.twitter) {
    this.rules = new DirectMessagesWelcomeMessagesRules(this.twitter);
  }

  /// Deletes a Welcome Message by the given id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/delete-welcome-message
  Future<void> destroy(String id) async {

  }

  /// Returns a Welcome Message by the given id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/get-welcome-message
  Future<void> show() async {

  }

  /// Returns a list of Welcome Messages.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/list-welcome-messages
  Future<void> list() async {

  }

  /// Creates a new Welcome Message that will be stored and sent in the future from the authenticating user in defined circumstances.
  /// Returns the message template if successful.
  /// Supports publishing with the same elements as Direct Messages (e.g. Quick Replies, media attachments).
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/new-welcome-message
  Future<void> create() async {

  }

  Future<void> update() async {

  }
}

class DirectMessagesWelcomeMessagesRules {
  final TwitterAPI twitter;

  DirectMessagesWelcomeMessagesRules(this.twitter);

  /// Deletes a Welcome Message Rule by the given id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/delete-welcome-message-rule
  Future<void> destroy(String id) async {

  }

  /// Returns a Welcome Message Rule by the given id.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/get-welcome-message-rule
  Future<void> show() async {

  }

  /// Returns a list of Welcome Message Rules.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/list-welcome-message-rules
  Future<void> list() async {

  }

  /// Creates a new Welcome Message Rule that determines which Welcome Message will be shown in a given conversation.
  /// Returns the created rule if successful.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/direct-messages/welcome-messages/api-reference/new-welcome-message-rule
  Future<void> create() async {

  }
}