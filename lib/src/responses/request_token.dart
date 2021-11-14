class RequestToken {
  String oauthToken;
  String oauthTokenSecret;

  RequestToken(
    this.oauthToken,
    this.oauthTokenSecret
  );

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
    json['oauth_token'],
    json['oauth_token_secret'],
  );
}