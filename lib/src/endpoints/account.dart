import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';

class Account {
  TwitterAPI twitter;

  Account(this.twitter);

  /// Returns settings (including current trend, geo and sleep time information) for the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-account-settings
  Future<void> getSettings() async {
    Response response = await twitter.get("/1.1/account/settings.json");
  }

  /// Updates the authenticating user's settings.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-settings
  Future<void> setSettings({
    /// When set to true , t or 1 , will enable sleep time for the user.
    bool? sleepTimeEnabled,

    /// The hour that sleep time should begin if it is enabled.
    int? startSleepTime,

    /// The hour that sleep time should end if it is enabled.
    int? endSleepTime,

    /// The timezone dates and times should be displayed in for the user.
    /// The timezone must be one of the Rails TimeZone names.
    String? timeZone,

    /// The Yahoo! Where On Earth ID to use as the user's default trend location.
    int? trendLocationWoeid,

    /// The language which Twitter should render in for this user.
    String? lang,
  }) async {
    Map<String, String> params = twitter.createParams({
      'sleep_time_enabled': sleepTimeEnabled,
      'start_sleep_time': startSleepTime,
      'end_sleep_time': endSleepTime,
      'time_zone': timeZone,
      'trend_location_woeid': trendLocationWoeid,
      'lang': lang
    });

    Response response = await twitter.post("/1.1/account/settings.json", params: params);
  }

  /// Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; returns a 401 status code and an error message if not.
  /// Use this method to test if supplied user credentials are valid.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-account-verify_credentials
  Future<void> verifyCredentials({
    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true, t or 1, statuses will not be included in the returned user object.
    bool? skipStatus,

    /// When set to true email will be returned in the user objects as a string.
    bool? includeEmail,
  }) async {
    Map<String, String> params = twitter.createParams({
      'include_entities': includeEntities,
      'skip_status': skipStatus,
      'include_email': includeEmail
    });

    Response response = await twitter.get("/1.1/account/verify_credentials.json", params: params);
  }

  /// Removes the uploaded profile banner for the authenticating user.
  /// Returns HTTP 200 upon success.
  ///
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/get-users-profile_banner
  Future<void> removeProfileBanner() async {
    Response response = await twitter.post("/1.1/account/remove_profile_banner.json");
  }

  /// Sets some values that users are able to set under the "Account" tab of their settings page.
  /// Only the parameters specified will be updated.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile
  Future<void> updateProfile({
    /// Full name associated with the profile.	
    String? name,

    /// URL associated with the profile. Will be prepended with http:// if not present.
    String? url,

    /// The city or country describing where the user of the account is located. The contents are not normalized or geocoded in any way.
    String? location,

    /// A description of the user owning the account.	
    String? description,

    /// Sets a hex value that controls the color scheme of links used on the authenticating user's profile page on twitter.com.
    /// This must be a valid hexadecimal value, and may be either three or six characters (ex: F00 or FF0000).
    String? profileLinkColor,

    /// The entities node will not be included when set to false.
    bool? includeEntities,

    /// When set to either true, t or 1 statuses will not be included in the returned user object.
    bool? skipStatus,
  }) async {
    Map<String, String> params = twitter.createParams({
      'name': name,
      'url': url,
      'location': location,
      'description': description,
      'profile_link_color': profileLinkColor,
      'include_entities': includeEntities,
      'skip_status': skipStatus,
    });
    
    Response response = await twitter.post("/1.1/account/update_profile.json", params: params);
  }

  /// Uploads a profile banner on behalf of the authenticating user.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_banner
  Future<void> updateProfileBanner(
    /// The Base64-encoded or raw image data being uploaded as the user's new profile banner.
    String banner,
    {
      /// The width of the preferred section of the image being uploaded in pixels.
      int? width,

      /// The height of the preferred section of the image being uploaded in pixels.
      int? height,

      /// The number of pixels by which to offset the uploaded image from the left.
      int? offsetLeft,

      /// The number of pixels by which to offset the uploaded image from the top.
      int? offsetTop,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'banner': banner,
      'width': width,
      'height': height,
      'offset_left': offsetLeft,
      'offset_top': offsetTop,
    });
    
    Response response = await twitter.post("/1.1/account/update_profile_banner.json", params: params);
  }

  /// Updates the authenticating user's profile image. Note that this method expects raw multipart data, not a URL to an image.
  /// 
  /// https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile_image
  Future<void> updateProfileImage(
    /// The avatar image for the profile, base64-encoded. Must be a valid GIF, JPG, or PNG image of less than 700 kilobytes in size.
    String image,
    {
      /// The entities node will not be included when set to false.
      bool? includeEntities,

      /// When set to either true, t or 1 statuses will not be included in the returned user objects.
      bool? skipStatus,
    }
  ) async {
    Map<String, String> params = twitter.createParams({
      'image': image,
      'include_entities': includeEntities,
      'skip_status': skipStatus,
    });
    
    Response response = await twitter.post("/1.1/account/update_profile_image.json", params: params);
  }
}