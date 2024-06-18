import 'dart:convert';

CreatePatientModel createPatientModelFromJson(String str) =>
    CreatePatientModel.fromJson(json.decode(str));

String createPatientModelToJson(CreatePatientModel data) =>
    json.encode(data.toJson());

class CreatePatientModel {
  String status;
  String message;
  PatientData patientData;

  CreatePatientModel({
    required this.status,
    required this.message,
    required this.patientData,
  });

  factory CreatePatientModel.fromJson(Map<String, dynamic> json) =>
      CreatePatientModel(
        status: json["status"],
        message: json["message"],
        patientData: PatientData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": patientData.toJson(),
      };
}

class PatientData {
  int id;
  String address;
  String age;
  String email;
  String fullName;
  String habits;
  String phoneNumber;
  String gender;
  DateTime birthDate;
  DateTime updatedAt;
  DateTime createdAt;

  PatientData({
    required this.id,
    required this.address,
    required this.age,
    required this.email,
    required this.fullName,
    required this.habits,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.updatedAt,
    required this.createdAt,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        id: json["id"],
        address: json["address"],
        age: json["age"],
        email: json["email"],
        fullName: json["fullName"],
        habits: json["habits"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birthDate"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "age": age,
        "email": email,
        "fullName": fullName,
        "habits": habits,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "birthDate": birthDate.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
