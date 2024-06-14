// To parse this JSON data, do
//
//     final createMedication = createMedicationFromJson(jsonString);

import 'dart:convert';

CreateMedicationModel createMedicationFromJson(String str) => CreateMedicationModel.fromJson(json.decode(str));

String createMedicationToJson(CreateMedicationModel data) => json.encode(data.toJson());

class CreateMedicationModel {
  String status;
  String message;
  MedicationData data;

  CreateMedicationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateMedicationModel.fromJson(Map<String, dynamic> json) => CreateMedicationModel(
    status: json["status"],
    message: json["message"],
    data: MedicationData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class MedicationData {
  int id;
  int patientId;
  String medicationList;
  String allergyList;
  DateTime updatedAt;
  DateTime createdAt;

  MedicationData({
    required this.id,
    required this.patientId,
    required this.medicationList,
    required this.allergyList,
    required this.updatedAt,
    required this.createdAt,
  });

  factory MedicationData.fromJson(Map<String, dynamic> json) => MedicationData(
    id: json["id"],
    patientId: json["PatientId"],
    medicationList: json["medicationList"],
    allergyList: json["allergyList"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "PatientId": patientId,
    "medicationList": medicationList,
    "allergyList": allergyList,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
