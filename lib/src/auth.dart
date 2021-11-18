import 'dart:math';
import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Allowed character bytes has described by Twitter/RFC 3986
List<int> allowedBytes = [
  0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, // 0-9
  0x41, 0x42, 0x43, 0x44, 0x45,0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B,0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51,0x52, 0x53, 0x54, 0x55, 0x56, 0x57,0x58, 0x59, 0x5A, // A-Z
  0x61, 0x62, 0x63, 0x64, 0x65,0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B,0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71,0x72, 0x73, 0x74, 0x75, 0x76, 0x77,0x78, 0x79, 0x7A, // a-z
  0x2D, 0x2E, 0x5F, 0x7E // - . _ ~
];

/// Type of keys used, Twitter for Android, Mac, etc
enum KeyType {
  Android,
  Mac,
  iOS,
  iPad,
  Other
}

class OAuthHelper {
  final String _signatureMethod = "HMAC-SHA1";
  final String _version = "1.0";

  late String _nonce;
  late String _timestamp;

  late String _consumerKey;
  late String _consumerSecret;
  late String? _token;
  late String? _tokenSecret;

  late KeyType type;

  OAuthHelper({
    required String consumerKey,
    required String consumerSecret,
    String? token,
    String? tokenSecret
  }) {
    _nonce = _getNonce();
    _timestamp = _getTimestamp();
    
    _consumerKey = consumerKey;
    _consumerSecret = consumerSecret;
    _token = token;
    _tokenSecret = tokenSecret;

    type = _getKeyType();
  }

  /// Get the key type based off the consumerKey+consumerSecret
  KeyType _getKeyType() {
    const Map<KeyType, String> hashes = {
      KeyType.Android: "bb627dabf83c0d81eef4517f2965f3e0",
      KeyType.iPad: "5a5702e07d415992c61b75995b91fb99",
      KeyType.iOS: "f9c60161c770d8cc806f7aaa78d12a38",
      KeyType.Mac: "063c9727eaa70eda40e49f2517f5afb2",
    };
    
    String toHash = "$_consumerKey+_$_consumerSecret";
    String hash = md5.convert(utf8.encode(toHash)).toString();

    KeyType keyType = hashes.keys.firstWhere((key) => hashes[key] == hash, orElse: () => KeyType.Other);
    return keyType;
  }

  /// Generates a Nonce string
  String _getNonce() {
    // Secure random number generator
    final Random random = Random.secure();

    // Generate a list of numbers
    final List<int> values = List<int>.generate(32, (i) => random.nextInt(256));

    // Create our nonce string based off our list of numbers
    final String nonce = base64Url.encode(values);

    // Strip non-alphanumeric characters
    return nonce.replaceAll(new RegExp(r'[^A-Za-z]'), '');
  }

  /// Percent encode a string 
  /// Documented here: https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/percent-encoding-parameters
  String _percentEncode(String value) {
    List<int> bytes = utf8.encode(value);

    String output = "";

    // Loop through each characters as bytes
    for (var i = 0; i < bytes.length; i++) {
      int byte = bytes[i];

      // Check if the byte is allowed
      if (!allowedBytes.contains(byte)) {
        output += String.fromCharCode(0x25);

        output += byte.toRadixString(16)[0].toUpperCase();
        output += byte.toRadixString(16)[1].toUpperCase();
      } else {
        output += String.fromCharCode(byte);
      }
    }

    return output;
  }

  /// Generate a timestamp
  String _getTimestamp() {
    // Convert "now" into seconds since epoch
    int timestamp = (new DateTime.now().millisecondsSinceEpoch / 1000).floor();

    return timestamp.toString();
  }

  /// Generate headers for a Request
  String getAuthHeader(String signature) {
    String encodeHeaderString(String key, String value) {
      String header = "${_percentEncode(key)}=\"${_percentEncode(value)}\"";

      return header;
    }

    List<String> _headers = [
      encodeHeaderString("oauth_consumer_key", _consumerKey),
      encodeHeaderString("oauth_nonce", _nonce),
      encodeHeaderString("oauth_signature", signature),
      encodeHeaderString("oauth_signature_method", _signatureMethod),
      encodeHeaderString("oauth_timestamp", _timestamp),
    ];

    if (_token != null) {
      _headers.add(encodeHeaderString("oauth_token", _token!));
    }

    _headers.add(encodeHeaderString("oauth_version", _version));

    return "OAuth ${_headers.join(", ")}";
  }

  /// Generate our oAuth signature
  String getSignature(String method, String url, Map<String, String> params) {
    // List of required oAuth paramters
    Map <String, String?> oauthParams = {
      "oauth_consumer_key": _consumerKey,
      "oauth_nonce": _nonce,
      "oauth_signature_method": _signatureMethod,
      "oauth_timestamp": _timestamp
    };

    // Only add oauth_token if it was specified
    if (_token != null) {
      oauthParams.addAll({
        "oauth_token": _token
      });
    }

    oauthParams.addAll({"oauth_version": _version});

    // Add our request param to the oauthParams
    oauthParams.addAll(params);

    // Encode our params
    List<String> encodedParams = <String>[];

    oauthParams.forEach((key, value) { 
      encodedParams.add("${_percentEncode(key)}=${_percentEncode(value!)}");
    });

    // Sort the encoded params 
    encodedParams.sort();

    // Create our parameter string
    String parameterString = encodedParams.join("&");

    String signatureBase = "";

    // Get our base URL
    String baseURL = url.replaceAll("?${Uri.parse(url).query}", "");
    
    signatureBase += method.toUpperCase() + "&";
    signatureBase += _percentEncode(baseURL) + "&";
    signatureBase += _percentEncode(parameterString);

    // Create our signing keyt
    String signingKey = "";

    signingKey += _percentEncode(_consumerSecret) + "&";

    if (_tokenSecret != null) {
      signingKey += _percentEncode(_tokenSecret!);
    }

    // Sign everything using Hmac with SHA1
    Hmac hmacSHA1 = new Hmac(sha1, utf8.encode(signingKey));
    Digest signature = hmacSHA1.convert(utf8.encode(signatureBase));

    return base64Url.encode(signature.bytes);
  }
}