//
// class AddClinicModel
// {
//   late   String status;
//   late String message;
//   late ClinicData clinicData;
//   AddClinicModel.fromJson(Map<String,dynamic> json)
//   {
//     status=json['status'];
//     status=json['message'];
//     if (json['data'] !=null) {
//       clinicData = ClinicData.fromJson(json['data']);
//     } else {
//       clinicData = ClinicData();
//     }
//
//   }
//
// }
// class ClinicData
// {
//   int   id=0;
//   String name='';
//   String address='';
//   String telePhoneNumber='';
//   String phoneNumber='';
//   String whatsappNumber='';
//   String ownerName='';
//   String ownerAddress='';
//   String ownerPhone='';
//
//
//
//
//   ClinicData({
//     this.id=0,
//     this.name='',
//     this.ownerPhone='',
//     this.ownerName='',
//     this.address='',
//     this.ownerAddress='',
//     this.phoneNumber='',
//     this.telePhoneNumber='',
//     this.whatsappNumber='',
//
//
//   }
//
//
//
//       );
//   ClinicData.fromJson(Map<String,dynamic> json)
//   {
//     id=json['id'];
//     name=json['name'];
//     ownerName=json['ownerName'];
//
//
//   }
// }



// class AddClinicModel {
//   late String status;
//   late String message;
//   late ClinicData clinicData;

//   // Constructor that takes all necessary parameters
//   AddClinicModel({
//     required this.status,
//     required this.message,
//     required this.clinicData,
//   });

//   // Factory constructor for creating an instance from JSON
//   factory AddClinicModel.fromJson(Map<String, dynamic> json) {
//     return AddClinicModel(
//       status: json['status'],
//       message: json['message'],
//       clinicData: ClinicData.fromJson(json['data']),
//     );
//   }
// }

// class ClinicData {
//   int id = 0;
//   String name = '';
//   String address = '';
//   String telePhoneNumber = '';
//   String phoneNumber = '';
//   String whatsappNumber = '';
//   String ownerName = '';
//   String ownerAddress = '';
//   String ownerPhone = '';

//   // Default constructor
//   ClinicData({
//     this.id = 0,
//     this.name = '',
//     this.ownerPhone = '',
//     this.ownerName = '',
//     this.address = '',
//     this.ownerAddress = '',
//     this.phoneNumber = '',
//     this.telePhoneNumber = '',
//     this.whatsappNumber = '',
//   });

//   // Constructor for creating an instance from JSON
//   ClinicData.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         name = json['name'],
//         ownerName = json['ownerName'];
// }


// To parse this JSON data, do
//
//     final addClinicModel = addClinicModelFromJson(jsonString);

import 'dart:convert';

AddClinicModel addClinicModelFromJson(String str) => AddClinicModel.fromJson(json.decode(str));

String addClinicModelToJson(AddClinicModel data) => json.encode(data.toJson());

class AddClinicModel {
    String status;
    String message;
    ClinicData clinicData;

    AddClinicModel({
        required this.status,
        required this.message,
        required this.clinicData,
    });

    factory AddClinicModel.fromJson(Map<String, dynamic> json) => AddClinicModel(
        status: json["status"],
        message: json["message"],
        clinicData: ClinicData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": clinicData.toJson(),
    };
}

class ClinicData {
    int id;
    String name;
    String address;
    String telePhoneNumber;
    String phoneNumber;
    String whatsappNumber;
    String ownerName;
    String ownerAddress;
    String ownerPhone;
    int userId;
    DateTime updatedAt;
    DateTime createdAt;

    ClinicData({
        required this.id,
        required this.name,
        required this.address,
        required this.telePhoneNumber,
        required this.phoneNumber,
        required this.whatsappNumber,
        required this.ownerName,
        required this.ownerAddress,
        required this.ownerPhone,
        required this.userId,
        required this.updatedAt,
        required this.createdAt,
    });

    factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        telePhoneNumber: json["telePhoneNumber"],
        phoneNumber: json["phoneNumber"],
        whatsappNumber: json["whatsappNumber"],
        ownerName: json["ownerName"],
        ownerAddress: json["ownerAddress"],
        ownerPhone: json["ownerPhone"],
        userId: json["userId"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "telePhoneNumber": telePhoneNumber,
        "phoneNumber": phoneNumber,
        "whatsappNumber": whatsappNumber,
        "ownerName": ownerName,
        "ownerAddress": ownerAddress,
        "ownerPhone": ownerPhone,
        "userId": userId,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
