class AccessToken {
  String token;
  String tokenSecret;
  String screenName;

  AccessToken(
    this.token,
    this.tokenSecret,
    this.screenName
  );

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
    json['oauth_token'],
    json['oauth_token_secret'],
    json['screen_name'],
  );
}