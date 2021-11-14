import 'package:twitter_client/src/api.dart';

class _SettingsParams {
  /// When set to true , t or 1 , will enable sleep time for the user.
  /// Sleep time is the time when push or SMS notifications should not be sent to the user.
  bool? sleepTimeEnabled;

  /// The hour that sleep time should begin if it is enabled.
  /// The value for this parameter should be provided in ISO 8601 format (i.e. 00-23).
  /// The time is considered to be in the same timezone as the user's time_zone setting.
  int? startSleepTime;

  /// The hour that sleep time should end if it is enabled.
  /// The value for this parameter should be provided in ISO 8601 format (i.e. 00-23).
  /// The time is considered to be in the same timezone as the user's time_zone setting.
  int? endSleepTime;

  /// The timezone dates and times should be displayed in for the user.
  /// The timezone must be one of the Rails TimeZone names.
  String? timeZone;

  /// The Yahoo! Where On Earth ID to use as the user's default trend location.
  /// Global information is available by using 1 as the WOEID.
  /// The WOEID must be one of the locations returned by GET trends/available .
  int? trendLocationWoeid;

  /// The language which Twitter should render in for this user.
  /// The language must be specified by the appropriate two letter ISO 639-1 representation.
  /// Currently supported languages are provided by this endpoint .
  String? lang;

  _SettingsParams({
    this.sleepTimeEnabled,
    this.startSleepTime,
    this.endSleepTime,
    this.timeZone,
    this.trendLocationWoeid,
    this.lang
  })
}

/// Implements all endpoints related to Account
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference
class Account {
  TwitterAPI twitter;

  Account(this.twitter);

  /// Returns settings (including current trend, geo and sleep time information) for the authenticating user.
  Future<void> settings(_SettingsParams? params) async {

  }

  /// Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; returns a 401 status code and an error message if not.
  /// Use this method to test if supplied user credentials are valid.
  Future<void> verifyCredentials() async {

  }

  /// Removes the uploaded profile banner for the authenticating user. Returns HTTP 200 upon success.
  Future<void> removeProfileBanner() async {

  }
}