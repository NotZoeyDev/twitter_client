/// Sizes object 
/// 
/// https://developer.twitter.com/en/docs/twitter-api/v1/data-dictionary/object-model/entities
class Sizes {
  /// Information for a thumbnail-sized version of the media.
  Size thumb;

  /// Information for a large-sized version of the media.
  Size large;

  /// Information for a medium-sized version of the media.
  Size medium;

  /// Information for a small-sized version of the media.
  Size small;

  Sizes(
    this.thumb,
    this.large,
    this.medium,
    this.small
  );

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
    Size.fromJson(json['thumb']),
    Size.fromJson(json['large']),
    Size.fromJson(json['medium']),
    Size.fromJson(json['small']),
  );
}

/// Size object 
class Size {
  /// Width in pixels of this size.
  String w;

  /// Height in pixels of this size.
  String h;

  /// Resizing method used to obtain this size.
  /// A value of fit means that the media was resized to fit one dimension, keeping its native aspect ratio.
  /// A value of crop means that the media was cropped in order to fit a specific resolution.
  String resize;

  Size(
    this.w,
    this.h,
    this.resize
  );

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    json['w'],
    json['h'],
    json['resize'],
  );
}