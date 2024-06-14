// To parse this JSON data, do
//
//     final createDisease = createDiseaseFromJson(jsonString);

import 'dart:convert';

CreateDiseaseModel createDiseaseFromJson(String str) => CreateDiseaseModel.fromJson(json.decode(str));

String createDiseaseToJson(CreateDiseaseModel data) => json.encode(data.toJson());

class CreateDiseaseModel {
  String status;
  String message;
  DiseaseData data;

  CreateDiseaseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CreateDiseaseModel.fromJson(Map<String, dynamic> json) => CreateDiseaseModel(
    status: json["status"],
    message: json["message"],
    data: DiseaseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class DiseaseData {
  int id;
  int patientId;
  String notes;
  DateTime updatedAt;
  DateTime createdAt;

  DiseaseData({
    required this.id,
    required this.patientId,
    required this.notes,
    required this.updatedAt,
    required this.createdAt,
  });

  factory DiseaseData.fromJson(Map<String, dynamic> json) => DiseaseData(
    id: json["id"],
    patientId: json["PatientId"],
    notes: json["notes"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "PatientId": patientId,
    "notes": notes,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
