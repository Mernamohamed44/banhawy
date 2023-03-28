class PatientHomeModel {
  bool? status;
  String? message;
  String? privacy;
  String? aboutUs;
  List<String>? address;
  List<String>? phone;
  SocialMedia? socialMedia;

  PatientHomeModel(
      {this.status,
        this.message,
        this.privacy,
        this.aboutUs,
        this.address,
        this.phone,
        this.socialMedia});

  PatientHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    privacy = json['privacy'];
    aboutUs = json['about_us'];
    address = json['address'].cast<String>();
    phone = json['phone'].cast<String>();
    socialMedia = json['social_media'] != null
        ? new SocialMedia.fromJson(json['social_media'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['privacy'] = this.privacy;
    data['about_us'] = this.aboutUs;
    data['address'] = this.address;
    data['phone'] = this.phone;
    if (this.socialMedia != null) {
      data['social_media'] = this.socialMedia!.toJson();
    }
    return data;
  }
}

class SocialMedia {
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? whatsapp;

  SocialMedia(
      {this.facebook,
        this.twitter,
        this.instagram,
        this.youtube,
        this.whatsapp});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}