class HomeOperation {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  HomeOperation({this.status, this.message, this.data, this.pagination});

  HomeOperation.fromJson(Map<String, dynamic> json) {
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
  String? doctor;
  String? patient;
  String? operationName;
  String? operationDate;
  String? operationOperationCenter;

  Data(
      {this.id,
      this.doctor,
      this.patient,
      this.operationName,
      this.operationDate,
      this.operationOperationCenter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    patient = json['patient'];
    operationName = json['operation_name'];
    operationDate = json['operation_date'];
    operationOperationCenter = json['operation_operation_center'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor'] = doctor;
    data['patient'] = patient;
    data['operation_name'] = operationName;
    data['operation_date'] = operationDate;
    data['operation_operation_center'] = operationOperationCenter;
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
