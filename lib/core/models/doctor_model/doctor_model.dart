class DoctorsModel {
  bool? status;
  String? message;
  Data? data;

  DoctorsModel({this.status, this.message, this.data});

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? profile;
  String? name;
  String? specialization;
  String? biography;

  Data({this.id, this.profile, this.name, this.specialization, this.biography});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['profile'];
    name = json['name'];
    specialization = json['specialization'];
    biography = json['biography'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['profile'] = profile;
    data['name'] = name;
    data['specialization'] = specialization;
    data['biography'] = biography;
    return data;
  }
}