class HomeDoctors {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  HomeDoctors({this.status, this.message, this.data, this.pagination});

  HomeDoctors.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? doctorId;
  String? profile;
  String? name;
  String? code;
  String? email;
  String? phone;
  State? state;
  State? city;
  int? gender;
  String? birthday;
  String? biography;
  String? operationName;
  String? operationDate;
  String? operationOperationCenter;

  Data(
      {this.id,
        this.doctorId,
        this.profile,
        this.name,
        this.code,
        this.email,
        this.phone,
        this.state,
        this.city,
        this.gender,
        this.birthday,
        this.biography,
        this.operationName,
        this.operationDate,
        this.operationOperationCenter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    profile = json['profile'];
    name = json['name'];
    code = json['code'];
    email = json['email'];
    phone = json['phone'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? State.fromJson(json['city']) : null;
    gender = json['gender'];
    birthday = json['birthday'];
    biography = json['biography'];
    operationName = json['operation_name'];
    operationDate = json['operation_date'];
    operationOperationCenter = json['operation_operation_center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['profile'] = profile;
    data['name'] = name;
    data['code'] = code;
    data['email'] = email;
    data['phone'] = phone;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['biography'] = biography;
    data['operation_name'] = operationName;
    data['operation_date'] = operationDate;
    data['operation_operation_center'] = operationOperationCenter;
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

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['count'] = count;
    data['per_page'] = perPage;
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    return data;
  }
}