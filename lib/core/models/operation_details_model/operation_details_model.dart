class OperationDetailsModel {
  bool? status;
  String? message;
  Patient? patient;
  String? doctorProfile;
  String? doctorName;
  String? doctorPhone;
  String? doctorSpecialization;
  String? notes;
  String? operationName;
  String? operationCenter;
  String? operationDate;
  List<DailyInstruction>? dailyInstruction;
  List<Prescriptions>? prescriptions;

  OperationDetailsModel(
      {this.status,
        this.message,
        this.patient,
        this.doctorProfile,
        this.doctorName,
        this.doctorPhone,
        this.doctorSpecialization,
        this.notes,
        this.operationName,
        this.operationCenter,
        this.operationDate,
        this.dailyInstruction,
        this.prescriptions});

  OperationDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    patient =
    json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    doctorProfile = json['doctor_profile'];
    doctorName = json['doctor_name'];
    doctorPhone = json['doctor_phone'];
    doctorSpecialization = json['doctor_specialization'];
    notes = json['notes'];
    operationName = json['operation_name'];
    operationCenter = json['operation_center'];
    operationDate = json['operation_date'];
    if (json['daily_instruction'] != null) {
      dailyInstruction = <DailyInstruction>[];
      json['daily_instruction'].forEach((v) {
        dailyInstruction!.add(DailyInstruction.fromJson(v));
      });
    }
    if (json['prescriptions'] != null) {
      prescriptions = <Prescriptions>[];
      json['prescriptions'].forEach((v) {
        prescriptions!.add(Prescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    data['doctor_profile'] = doctorProfile;
    data['doctor_name'] = doctorName;
    data['doctor_phone'] = doctorPhone;
    data['doctor_specialization'] = doctorSpecialization;
    data['notes'] = notes;
    data['operation_name'] = operationName;
    data['operation_center'] = operationCenter;
    data['operation_date'] = operationDate;
    if (dailyInstruction != null) {
      data['daily_instruction'] =
          dailyInstruction!.map((v) => v.toJson()).toList();
    }
    if (prescriptions != null) {
      data['prescriptions'] =
          prescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patient {
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

  Patient(
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

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    userTypeId = json['user_type_id'];
    status = json['status'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    city = json['city'] != null ? State.fromJson(json['city']) : null;
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

class DailyInstruction {
  int? id;
  String? day;
  String? instruction;
  String? link;
  String? image;

  DailyInstruction(
      {this.id, this.day, this.instruction, this.link, this.image});

  DailyInstruction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    instruction = json['instruction'];
    link = json['link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['instruction'] = instruction;
    data['link'] = link;
    data['image'] = image;
    return data;
  }
}

class Prescriptions {
  Drug? drug;
  String? dosage;
  String? duration;

  Prescriptions({this.drug, this.dosage, this.duration});

  Prescriptions.fromJson(Map<String, dynamic> json) {
    drug = json['drug'] != null ? Drug.fromJson(json['drug']) : null;
    dosage = json['dosage'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (drug != null) {
      data['drug'] = drug!.toJson();
    }
    data['dosage'] = dosage;
    data['duration'] = duration;
    return data;
  }
}

class Drug {
  int? id;
  String? name;
  String? video;
  String? compound;

  Drug({this.id, this.name, this.video, this.compound});

  Drug.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    compound = json['compound'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['video'] = video;
    data['compound'] = compound;
    return data;
  }
}