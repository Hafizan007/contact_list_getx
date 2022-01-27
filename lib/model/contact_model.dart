class ContactModel {
  bool? success;
  List<Data>? data;
  String? message;
  int? code;

  ContactModel({this.success, this.data, this.message, this.code});

  ContactModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['code'] = code;
    return data;
  }
}

class Data {
  String? contactId;
  String? name;
  String? email;
  String? phoneNumber;
  String? notes;
  List<String>? labels;
  String? creator;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.contactId,
      this.name,
      this.email,
      this.phoneNumber,
      this.notes,
      this.labels,
      this.creator,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    contactId = json['contactId'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    notes = json['notes'];
    labels = json['labels'].cast<String>();
    creator = json['creator'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactId'] = contactId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['notes'] = notes;
    data['labels'] = labels;
    data['creator'] = creator;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
