//
//
// class CreatePatientModelModel
// {
//   late   String status;
//   late String message;
//   late PatientData patientData;
//   CreatePatientModelModel.fromJson(Map<String,dynamic> json)
//   {
//     status=json['status'];
//     status=json['message'];
//     if (json['data'] !=null) {
//       patientData = PatientData.fromJson(json['data']);
//     } else {
//       patientData = PatientData();
//     }
//
//   }
//
// }
// class PatientData
// {
//   int   id=0;
//   String fullName='';
//   String address='';
//   String habits='';
//   String age='';
//   String email='';
//   String phoneNumber='';
//  // DateTime birthDate;
//   String gender='';
//
//
//
//
//   PatientData({
//     this.id=0,
//     this.fullName='',
//     this.address='',
//     this.phoneNumber='',
//     this.habits='',
//     this.gender='',
//     this.email='',
//     this.age='',
//     //this.birthDate= DateTime.now(),
//
//
//   }
//
//
//
//       );
//   PatientData.fromJson(Map<String,dynamic> json)
//   {
//     id=json['id'];
//     fullName=json['fullName'];
//     habits=json['habits'];
//     gender=json['gender'];
//     phoneNumber=json['phoneNumber'];
//
//
//   }
// }


// To parse this JSON data, do
//
//     final createPatient = createPatientFromJson(jsonString);

import 'dart:convert';

CreatePatientModel createPatientFromJson(String str) => CreatePatientModel.fromJson(json.decode(str));

String createPatientToJson(CreatePatientModel data) => json.encode(data.toJson());

class CreatePatientModel {
  String status;
  String message;
  PatientData data;

  CreatePatientModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreatePatientModel.fromJson(Map<String, dynamic> json) => CreatePatientModel(
    status: json["status"],
    message: json["message"],
    data: PatientData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
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
  dynamic birthDate;

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
    birthDate: json["birthDate"],
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
    "birthDate": birthDate,
  };
}
