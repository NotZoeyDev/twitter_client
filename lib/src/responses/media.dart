class MediaUpload {
  int? mediaID;
  String? mediaIDString;
  String? mediaKey;
  int? size;
  int? expiresAfterSecs;
  _MediaUploadImage? image;
  
  MediaUpload(
    this.mediaID,
    this.mediaIDString,
    this.mediaKey,
    this.size,
    this.expiresAfterSecs,
    this.image
  );

  factory MediaUpload.fromJson(Map<String, dynamic> json) => MediaUpload(
    json['media_id'],
    json['media_id_string'],
    json['media_key'],
    json['size'],
    json['expires_after_secs'],
    _MediaUploadImage.fromJson(json['image'])
  );
}

class _MediaUploadImage {
  String? imageType;
  int? w;
  int? h;

  _MediaUploadImage(this.imageType, this.w, this.h);

  factory _MediaUploadImage.fromJson(Map<String, dynamic> json) => _MediaUploadImage(
    json['image_type'],
    json['w'],
    json['h']
  );
}