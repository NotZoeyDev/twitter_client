import 'package:http/http.dart';
import 'package:twitter_client/src/api.dart';
import 'package:twitter_client/src/responses/access_token.dart';
import 'package:twitter_client/src/responses/request_token.dart';

class OAuth {
  final TwitterAPI twitter;

  OAuth(this.twitter);

  /// Convert a list of (value=key&value=key) into a map
  Map<String, String> _responseToMap(String response) {
    Map<String, String> output = new Map();
    List<String> pairList = response.split("&");

    pairList.forEach((element) { 
      List<String> values = element.split("=");
      output.addAll({
        values[0]: values[1]
      });
    });

    return output;
  }

  /// Generate an Oauth token to authorize an user
  Future<RequestToken> requestToken() async {
    Response response = await twitter.post("/oauth/request_token", params: {
      "oauth_callback": "oob"
    });

    Map<String, String> values = _responseToMap(response.body);
    return RequestToken.fromJson(values);
  }

  /// Get an authorization URL using [oauthToken]
  String authorizationUrl(String oauthToken) {
    return "https://api.twitter.com/oauth/authenticate?oauth_token=$oauthToken";
  }

  /// Get the user's access token using the [oauthToken] and [oauthVerifier]
  Future<AccessToken> accessToken(String oauthToken, String oauthVerifier) async {
    Response response = await twitter.post("/oauth/access_token", params: {
      "oauth_token": oauthToken,
      "oauth_verifier": oauthVerifier
    });

    Map<String, String> values = _responseToMap(response.body);
    return AccessToken.fromJson(values);
  }

  /// Get the user's access token via xauth ([username] + [password] login)
  Future<AccessToken> accessTokenViaXauth(String username, String password) async {
    Response response = await twitter.post("/oauth/access_token", body: {
      "x_auth_mode": "client_auth",
      "x_auth_password": password,
      "x_auth_username": username
    });

    if (response.body == "Login denied due to suspicious activity. Please check your email for further login instructions.") throw("Login denied.");
    if (response.body == "Invalid user name or password") throw("Invalid username or password.");

    Map<String, String> values = _responseToMap(response.body);
    return AccessToken.fromJson(values);
  }
}