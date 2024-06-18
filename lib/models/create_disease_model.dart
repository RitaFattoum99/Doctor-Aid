import 'dart:convert';

CreateDiseaseModel createDiseaseModelFromJson(String str) => CreateDiseaseModel.fromJson(json.decode(str));

String createDiseaseModelToJson(CreateDiseaseModel data) => json.encode(data.toJson());

class CreateDiseaseModel {
    String status;
    String message;
    DiseaseData diseaseData;

    CreateDiseaseModel({
        required this.status,
        required this.message,
        required this.diseaseData,
    });

    factory CreateDiseaseModel.fromJson(Map<String, dynamic> json) => CreateDiseaseModel(
        status: json["status"],
        message: json["message"],
        diseaseData: DiseaseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": diseaseData.toJson(),
    };
}

class DiseaseData {
    int id;
    int patientId;
    String diseaseList;
    String notes;
    DateTime updatedAt;
    DateTime createdAt;

    DiseaseData({
        required this.id,
        required this.patientId,
        required this.diseaseList,
        required this.notes,
        required this.updatedAt,
        required this.createdAt,
    });

    factory DiseaseData.fromJson(Map<String, dynamic> json) => DiseaseData(
        id: json["id"],
        patientId: json["PatientId"],
        diseaseList: json["diseaseList"],
        notes: json["notes"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "PatientId": patientId,
        "diseaseList": diseaseList,
        "notes": notes,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}
