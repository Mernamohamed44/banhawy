class UserModel {
  bool? status;
  String? message;
  String? token;
  String? deviceToken;
  Data? data;

  UserModel(
      {this.status, this.message, this.token, this.deviceToken, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    deviceToken = json['device_token'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    data['device_token'] = deviceToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? code;
  String? name;
  String? phone;
  String? email;
  int? userTypeId;
  int? status;
  State? state;
  State? city;
  String? profile;
  String? specialization;
  int? gender;
  String? birthday;
  String? biography;
  String? address;

  Data(
      {this.id,
        this.code,
        this.name,
        this.phone,
        this.email,
        this.userTypeId,
        this.status,
        this.state,
        this.city,
        this.profile,
        this.specialization,
        this.gender,
        this.birthday,
        this.biography,
        this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    userTypeId = json['user_type_id'];
    status = json['status'];
    state = json['state'] != null ?  State.fromJson(json['state']) : null;
    city = json['city'] != null ?  State.fromJson(json['city']) : null;
    profile = json['profile'];
    specialization = json['specialization'];
    gender = json['gender'];
    birthday = json['birthday'];
    biography = json['biography'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['user_type_id'] = userTypeId;
    data['status'] = status;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['profile'] = profile;
    data['specialization'] = specialization;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['biography'] = biography;
    data['address'] = address;
    return data;
  }
}

class State {
  int? id;
  String? title;

  State({this.id, this.title});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}