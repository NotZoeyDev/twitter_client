class AccessToken {
  String oauthToken;
  String oauthTokenSecret;
  String screenName;

  AccessToken({
    this.oauthToken,
    this.oauthTokenSecret,
    this.screenName
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
    oauthToken: json['oauth_token'],
    oauthTokenSecret: json['oauth_token_secret'],
    screenName: json['screen_name']
  );
}