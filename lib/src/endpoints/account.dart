import 'package:twitter_client/src/api.dart';

class SettingsParams {
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

  SettingsParams({
    this.sleepTimeEnabled,
    this.startSleepTime,
    this.endSleepTime,
    this.timeZone,
    this.trendLocationWoeid,
    this.lang
  });
}

class ProfileParams {
  /// Full name associated with the profile.	
  String? name;

  /// URL associated with the profile. Will be prepended with http:// if not present.
  String? url;

  /// The city or country describing where the user of the account is located. The contents are not normalized or geocoded in any way.
  String? location;

  /// A description of the user owning the account.	
  String? description;

  /// Sets a hex value that controls the color scheme of links used on the authenticating user's profile page on twitter.com.
  /// This must be a valid hexadecimal value, and may be either three or six characters (ex: F00 or FF0000).
  String? profileLinkColor;

  /// The entities node will not be included when set to false.
  bool? includeEntities;

  /// When set to either true, t or 1 statuses will not be included in the returned user object.
  String? skipStatus;

  ProfileParams({
    this.name,
    this.url,
    this.location,
    this.description,
    this.profileLinkColor,
    this.includeEntities,
    this.skipStatus
  });
}

class Account {
  TwitterAPI twitter;

  Account(this.twitter);

  /// Returns settings (including current trend, geo and sleep time information) for the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-account-settings
  Future<void> getSettings() async {

  }

  /// Updates the authenticating user's settings.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-settings
  Future<void> setSettings(SettingsParams params) async {

  }

  /// Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; returns a 401 status code and an error message if not.
  /// Use this method to test if supplied user credentials are valid.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-account-verify_credentials
  Future<void> verifyCredentials() async {

  }

  /// Returns a map of the available size variations of the specified user's profile banner.
  /// If the user has not uploaded a profile banner, a HTTP 404 will be served instead.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner
  Future<void> profileBanner() async {

  }

  /// Removes the uploaded profile banner for the authenticating user.
  /// Returns HTTP 200 upon success.
  ///
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner
  Future<void> removeProfileBanner() async {

  }

  /// Sets some values that users are able to set under the "Account" tab of their settings page.
  /// Only the parameters specified will be updated.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile
  Future<void> updateProfile(ProfileParams params) async {

  }

  /// Uploads a profile banner on behalf of the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_banner
  Future<void> updateProfileBanner() async {

  }

  /// Updates the authenticating user's profile image. Note that this method expects raw multipart data, not a URL to an image.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_image
  Future<void> updateProfileImage() async {

  }
}