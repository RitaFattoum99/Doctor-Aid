// To parse this JSON data, do
//
//     final completedTreatmentModel = completedTreatmentModelFromJson(jsonString);

import 'dart:convert';

CompletedTreatmentModel completedTreatmentModelFromJson(String str) =>
    CompletedTreatmentModel.fromJson(json.decode(str));

String completedTreatmentModelToJson(CompletedTreatmentModel data) =>
    json.encode(data.toJson());

class CompletedTreatmentModel {
  String status;
  String message;
  CompletedTreatmentData completedTreatmentData;

  CompletedTreatmentModel({
    required this.status,
    required this.message,
    required this.completedTreatmentData,
  });

  factory CompletedTreatmentModel.fromJson(Map<String, dynamic> json) =>
      CompletedTreatmentModel(
        status: json["status"],
        message: json["message"],
        completedTreatmentData: CompletedTreatmentData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": completedTreatmentData.toJson(),
      };
}

class CompletedTreatmentData {
  int id;
  int patientId;
  int treatmentId;
  String place;
  int fromTeeth;
  int toTeeth;
  String notes;
  DateTime updatedAt;
  DateTime createdAt;

  CompletedTreatmentData({
    required this.id,
    required this.patientId,
    required this.treatmentId,
    required this.place,
    required this.fromTeeth,
    required this.toTeeth,
    required this.notes,
    required this.updatedAt,
    required this.createdAt,
  });

  factory CompletedTreatmentData.fromJson(Map<String, dynamic> json) =>
      CompletedTreatmentData(
        id: json["id"],
        patientId: json["PatientId"],
        treatmentId: json["treatmentId"],
        place: json["place"],
        fromTeeth: json["fromTeeth"],
        toTeeth: json["toTeeth"],
        notes: json["notes"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "PatientId": patientId,
        "treatmentId": treatmentId,
        "place": place,
        "fromTeeth": fromTeeth,
        "toTeeth": toTeeth,
        "notes": notes,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
