// ignore_for_file: avoid_print, deprecated_member_use
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/all_patients.dart';
import 'package:draid/models/completed_treatment.dart';
import 'package:draid/models/create_attachment_model.dart';
import 'package:draid/models/create_complaint_model.dart';
import 'package:draid/models/create_disease_model.dart';
import 'package:draid/models/create_medication_model.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/models/treatment.dart';
import 'package:draid/models/treatment_plan.dart';
import 'package:draid/models/user_model.dart';
import 'package:draid/modules/dashboard/dashboard_screen.dart';
import 'package:draid/modules/finance/account_and_revenues/all_accounts.dart';
import 'package:draid/modules/finance/account_and_revenues/debts_patient.dart';
import 'package:draid/modules/finance/account_and_revenues/revenues.dart';
import 'package:draid/modules/finance/bill_payments.dart';
import 'package:draid/modules/finance/bill_payments/all_payments.dart';
import 'package:draid/modules/finance/bill_payments/expenses.dart';
import 'package:draid/modules/finance/bill_payments/incomplete_bill.dart';
import 'package:draid/modules/finance/bill_payments/provider.dart';
import 'package:draid/modules/finance/patient_account.dart';
import 'package:draid/modules/finance/show_bill_information.dart';
import 'package:draid/modules/patient/attachments/attachments_screen.dart';
import 'package:draid/modules/patient/medicine_and_disease/disease.dart';
import 'package:draid/modules/patient/medicine_and_disease/medicine.dart';
import 'package:draid/modules/patient/medicines_and_diseases.dart';
import 'package:draid/modules/patient/show_basic_information.dart';
import 'package:draid/modules/patient/treatments/complete_treatments.dart';
import 'package:draid/modules/patient/treatments/treatments_information.dart';
import 'package:draid/modules/patient/treatments/treatments_plans.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/network/remote/dio_helper.dart';
import 'package:draid/shared/network/remote/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrAidCubit extends Cubit<DrAidStates> {
  DrAidCubit() : super(DrAidInitialState());

  static DrAidCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  int treatmentindex = 0;
  int medicineindex = 0;
  bool checkBoxValue = false;
  String toothOrGum = 'سن';
  UserModel? userModel;
  AddClinicModel? addClinicModel;
  CreatePatientModel? createPatientModel;
  CreateMedicationModel? createMedicationModel;
  CreateDiseaseModel? createDiseaseModel;
  CreateComplaintModel? createComplaintModel;
  CreateAttachmentModel? createAttachmentModel;
  TreatmentModel? treatmentModel;
  TreatmentPlanModel? treatmentPlanModel;
  CompletedTreatmentModel? completedTreatmentModel;

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(DrAidLoadingState());

    DioHelper.signUpandLoginPostData(
      url: loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      if (value.data != null) {
        userModel = UserModel.fromJson(value.data);
        print("status: ${userModel?.status}");
        print("msg: ${userModel?.msg}");
        print("data: ${userModel?.userData}");
        print("token: ${userModel?.token}");
        emit(DrAidLoginSuccessState(userModel!));

        // Navigate to dashboard after successful login
        navigateTo(
          context,
          const Directionality(
              textDirection: TextDirection.rtl, child: DashboardScreen()),
        );
        print("navigate");
      } else {
        print("Response data is null");
        emit(DrAidLoginErrorState("Response data is null"));
      }
    }).catchError((error) {
      print('Login Error: $error');
      emit(DrAidLoginErrorState(error.toString()));
    });
  }

  void createClinic({
    required String name,
    required String token,
    required String address,
    required String telePhoneNumber,
    required String phoneNumber,
    required String whatsappNumber,
    required String ownerName,
    required String userEmail,
    required String ownerAddress,
    required String ownerPhone,
  }) {
    DioHelper.postData(
            url: clinic,
            data: {
              'name': name,
              'address': address,
              'telePhoneNumber': telePhoneNumber,
              'phoneNumber': phoneNumber,
              'whatsappNumber': whatsappNumber,
              'ownerName': ownerName,
              'userEmail': userEmail,
              'ownerAddress': ownerAddress,
              'ownerPhone': ownerPhone,
            },
            token: token
            // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZnVsbE5hbWUiOiLYo9it2YXYryDYtNmK2K4g2KfZhNi02KjYp9ioIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNzE4NTczMjg0fQ.A1mSnG2O5jz8hy8OReQorjrCybqFNPdOx0mhSYNUbzM'
            )
        .then((value) {
      if (value.data != null) {
        addClinicModel = AddClinicModel.fromJson(value.data);
        print(addClinicModel?.status);
        print(addClinicModel?.clinicData);
        print(addClinicModel?.message);
        print("ownerAddress: ${addClinicModel?.clinicData.ownerAddress}");
        print("ownerPhone: ${addClinicModel?.clinicData.ownerPhone}");
        emit(DrAidClinicSuccessState(addClinicModel!));
      } else {
        print("Response data is null");
        emit(DrAidClinicErrorState("Response data is null"));
      }
    }).catchError((error) {
      print('Create Clinic Error: $error');
      emit(DrAidClinicErrorState(error.toString()));
    });
  }

  void createPatient({
    required int clinicId,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String address,
    required String age,
    required String habits,
    required String gender,
    required DateTime birthDate,
    required String token,
  }) {
    String formattedBirthDate = birthDate.toIso8601String();

    // Log the request data
    print("Sending request to create patient with data:");
    print({
      "clinicId": clinicId,
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "email": email,
      "address": address,
      "age": age,
      "habits": habits,
      "gender": gender,
      "birthDate": formattedBirthDate,
      "token": token,
    });

    DioHelper.postData(
      url: patient,
      data: {
        "clinicId": clinicId,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address,
        "age": age,
        "habits": habits,
        "gender": gender,
        "birthDate": formattedBirthDate,
      },
      token: token,
    ).then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createPatientModel = CreatePatientModel.fromJson(value.data);
        print("status: ${createPatientModel?.status}");
        print(createPatientModel?.patientData);
        print(createPatientModel?.message);
        print("ownerAddress: ${createPatientModel?.patientData.address}");
        print("ownerPhone: ${createPatientModel?.patientData.phoneNumber}");
        emit(DrAidPatientSuccessState(createPatientModel!));
      } else {
        print("status: ${createPatientModel?.status}");
        print("Response data is null");
        emit(DrAidPatientErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidPatientErrorState(error.toString()));
    });
  }

  void createMedicine({
    required int patientId,
    required String medicationList,
    required String allergyList,
    required String token,
  }) {
    // Log the request data
    print("Sending request to create medicine with data:");
    print({
      'PatientId': patientId,
      'medicationList': medicationList,
      'allergyList': allergyList,
      "token": token,
    });
    DioHelper.postData(
            url: '$patient/$patientId/$medication',
            data: {
              'medicationList': medicationList,
              'allergyList': allergyList,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createMedicationModel = CreateMedicationModel.fromJson(value.data);
        print("status: ${createMedicationModel?.status}");
        print(createMedicationModel?.medicationData);
        print(createMedicationModel?.message);
        print(
            "allergyList: ${createMedicationModel?.medicationData.allergyList}");
        print(
            "medicationList: ${createMedicationModel?.medicationData.medicationList}");
        emit(DrAidMedicationSuccessState(createMedicationModel!));
      } else {
        print("status: ${createMedicationModel?.status}");
        print("Response data is null");
        emit(DrAidMedicationErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidMedicationErrorState(error.toString()));
    });
  }

  void createDisease({
    required int patientId,
    required String diseaseList,
    required String notes,
    required String token,
  }) {
    // Log the request data
    print("Sending request to create medicine with data:");
    print({
      'PatientId': patientId,
      'diseaseList': diseaseList,
      'notes': notes,
      "token": token,
    });
    DioHelper.postData(
            // url: 'patient/$patientId/disease',
            url: '$patient/$patientId/$disease',
            data: {
              'diseaseList': diseaseList,
              'notes': notes,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createDiseaseModel = CreateDiseaseModel.fromJson(value.data);

        print("status: ${createDiseaseModel?.status}");
        print(createDiseaseModel?.diseaseData);
        print(createDiseaseModel?.message);
        print("diseaseList: ${createDiseaseModel?.diseaseData.diseaseList}");
        print("notes: ${createDiseaseModel?.diseaseData.notes}");
        emit(DrAidDiseaseSuccessState(createDiseaseModel!));
      } else {
        print("status: ${createDiseaseModel?.status}");
        print("Response data is null");
        emit(DrAidDiseaseErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidDiseaseErrorState(error.toString()));
    });
  }

  void createComplaint({
    required int patientId,
    required String complaintText,
    required String consultation,
    required String token,
  }) {
    // Log the request data
    print("Sending request to create complaint with data:");
    print({
      'PatientId': patientId,
      'complaintText': complaintText,
      'consultation': consultation,
      "token": token,
    });
    DioHelper.postData(
            url: '$patient/$patientId/$complaint',
            data: {
              'complaintText': complaintText,
              'consultation': consultation,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createComplaintModel = CreateComplaintModel.fromJson(value.data);

        print("status: ${createComplaintModel?.status}");
        print(createComplaintModel?.complaintData);
        print(createComplaintModel?.message);
        print(
            "complaintText: ${createComplaintModel?.complaintData.complaintText}");
        print(
            "consultation: ${createComplaintModel?.complaintData.consultation}");
        emit(DrAidComplaintSuccessState(createComplaintModel!));
      } else {
        print("status: ${createComplaintModel?.status}");
        print("Response data is null");
        emit(DrAidComplaintErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidComplaintErrorState(error.toString()));
    });
  }

  void createAttachment({
    required int patientId,
    required String title,
    required html.File file,
    required String token,
  }) async {
    // Log the request data
    print("Sending request to create attachments with data:");
    print({
      'PatientId': patientId,
      'title': title,
      'attachments': file.name,
      "token": token,
    });

    // Read the file as bytes
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoadEnd.first;

    final bytes = reader.result as Uint8List;

    // Prepare form data
    FormData formData = FormData.fromMap({
      'title': title,
      'attachments': MultipartFile.fromBytes(bytes, filename: file.name),
    });

    DioHelper.postFormData(
      url: '$patient/$patientId/$attachments',
      formData: formData,
      token: token,
    ).then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createAttachmentModel = CreateAttachmentModel.fromJson(value.data);

        print("status: ${createAttachmentModel?.status}");
        print(createAttachmentModel?.attachmentData);
        print(createAttachmentModel?.message);
        print("title: ${createAttachmentModel?.attachmentData[0].title}");
        print("url: ${createAttachmentModel?.attachmentData[0].url}");
        emit(DrAidAttachmentSuccessState(createAttachmentModel!));
      } else {
        print("status: ${createAttachmentModel?.status}");
        print("Response data is null");
        emit(DrAidAttachmentErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidAttachmentErrorState(error.toString()));
    });
  }

  void createTreatment({
    required int clinicId,
    required String token,
    required String title,
    required String category,
    required int defaultCost,
    required String description,
    required String color,
  }) {
    // Log the request data
    print("Sending request to create treatment with data:");
    print({
      'clinicId': clinicId,
      'title': title,
      'category': category,
      "defaultCost": defaultCost,
      "description": description,
      "color": color
    });
    DioHelper.postData(
            url: '$clinic/$clinicId/$treatment',
            data: {
              'title': title,
              'category': category,
              "defaultCost": defaultCost,
              "description": description,
              "color": color
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        treatmentModel = TreatmentModel.fromJson(value.data);

        print("status: ${treatmentModel?.status}");
        print(treatmentModel?.treatmentData);
        print(treatmentModel?.message);
        print("title: ${treatmentModel?.treatmentData.title}");
        print("category: ${treatmentModel?.treatmentData.category}");

        emit(DrAidTreatmentSuccessState(treatmentModel!));
      } else {
        print("status: ${treatmentModel?.status}");
        print("Response data is null");
        emit(DrAidTreatmentErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidTreatmentErrorState(error.toString()));
    });
  }

  void createTreatmentPlan({
    required int patientId,
    required String token,
    required int sessionNumber,
    required double discount,
    required double totalCost,
  }) {
    // Log the request data
    print("Sending request to create treatment plan with data:");
    print({
      'patientId': patientId,
      'sessionNumber': sessionNumber,
      'discount': discount,
      "totalCost": totalCost,
    });
    DioHelper.postData(
            url: '$patient/$patientId/$treatmentPlan',
            data: {
              'sessionNumber': sessionNumber,
              'discoutn': discount,
              "totalCost": totalCost,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        treatmentPlanModel = TreatmentPlanModel.fromJson(value.data);

        print("status: ${treatmentPlanModel?.status}");
        print(treatmentPlanModel?.treatmentPlanData);
        print(treatmentPlanModel?.message);
        print(
            "isCompleted: ${treatmentPlanModel?.treatmentPlanData.isCompleted}");
        print(
            "sessionNumber: ${treatmentPlanModel?.treatmentPlanData.sessionNumber}");
        print("totalCost: ${treatmentPlanModel?.treatmentPlanData.totalCost}");

        emit(DrAidTreatmentPlanSuccessState(treatmentPlanModel!));
      } else {
        print("status: ${treatmentPlanModel?.status}");
        print("Response data is null");
        emit(DrAidTreatmentPlanErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidTreatmentPlanErrorState(error.toString()));
    });
  }

  void createCompletedTreatment({
    required int patientId,
    required String token,
    required int treatmentId,
    required int fromTeeth,
    required int toTeeth,
    required String place,
    required String notes,
  }) {
    // Log the request data
    print("Sending request to create completed treatment with data:");
    print({
      'patientId': patientId,
      'treatmentId': treatmentId,
      'fromTeeth': fromTeeth,
      "toTeeth": toTeeth,
      "place": place,
      "notes": notes,
    });
    DioHelper.postData(
            url: '$patient/$patientId/$completedTreatments',
            data: {
              'treatmentId': treatmentId,
              'fromTeeth': fromTeeth,
              "toTeeth": toTeeth,
              "place": place,
              "notes": notes,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        completedTreatmentModel = CompletedTreatmentModel.fromJson(value.data);

        print("status: ${completedTreatmentModel?.status}");
        print(completedTreatmentModel?.completedTreatmentData);
        print(completedTreatmentModel?.message);
        print(
            "patientId: ${completedTreatmentModel?.completedTreatmentData.patientId}");
        print(
            "treatmentId: ${completedTreatmentModel?.completedTreatmentData.treatmentId}");
        print(
            "notes: ${completedTreatmentModel?.completedTreatmentData.notes}");
        print(
            "fromTeeth: ${completedTreatmentModel?.completedTreatmentData.fromTeeth}");
        print(
            "toTeeth: ${completedTreatmentModel?.completedTreatmentData.toTeeth}");

        emit(DrAidCompletedTreatmentSuccessState(completedTreatmentModel!));
      } else {
        print("status: ${completedTreatmentModel?.status}");
        print("Response data is null");
        emit(DrAidCompletedTreatmentErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidCompletedTreatmentErrorState(error.toString()));
    });
  }

  void getPatient({
    required int patientId,
    required String token,
  }) {
    print("Sending request to get patient data for patient ID: $patientId");

    DioHelper.getData(
      url: 'patient/$patientId',
      token: token,
    ).then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        // Assuming you have a model for the patient data
        PatientData patientModel = PatientData.fromJson(value.data['data']);
        CreatePatientModel createPatientModel = CreatePatientModel(
          status: value.data['status'],
          message: value.data['message'],
          patientData: patientModel,
        );

        print("fullName: ${createPatientModel.patientData.fullName}");
        print(
            "address: ${createPatientModel.patientData.getAddress()}"); // Properly handle nullable address

        emit(DrAidPatientSuccessState(createPatientModel));
      } else {
        print("Response data is null");
        emit(DrAidPatientErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidPatientErrorState(error.toString()));
    });
  }

  void getAllPatients({
    required String token,
    required int clinicId,
  }) {
    print("Sending request to get all patients");

    DioHelper.getData(
      url: '$clinic/$clinicId/$patients',
      token: token,
    ).then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        AllPatientsModel allPatients = AllPatientsModel.fromJson(value.data);

        // Example: Print names of all patients
        for (var patient in allPatients.patientDataList) {
          print("fullName: ${patient.fullName}");
          print("address: ${patient.getAddress()}");
        }

        emit(DrAidAllPatientSuccessState(allPatients));
      } else {
        print("Response data is null");
        emit(DrAidPatientErrorState("Response data is null"));
      }
    }).catchError((error) {
      print("Request failed with error: $error");
      if (error is DioError) {
        print("Error type: ${error.type}");
        print("Error response: ${error.response}");
        print("Error message: ${error.message}");
        print("Error request options: ${error.requestOptions}");
        if (error.response != null) {
          print("Error response data: ${error.response?.data}");
        }
      }
      emit(DrAidPatientErrorState(error.toString()));
    });
  }

  void changeMedicineIndex(int medicine) {
    medicineindex = medicine;
    emit(ChangeMedicine());
  }

  void changeCurrentIndex(int index) {
    currentindex = index;
    emit(ChangeBottomScreenState());
  }

  void printCurrentIndex() {}

  List<Widget> bottomPatientscreens = [
    ShowBasicInformation(),
    MedicinesAndDiseases(),
    TreatmentsInformation(),
    const AttachmentsScreen(),
  ];
  List<Widget> medicineanddiseasescreen = [
    const MedicineScreen(),
    const DiseaseScreen(),
  ];

  List<Widget> bottomFinancescreens = const [
    ShowBillInformation(),
    PatientAccount(), // --> accountAndRevenues
    BillPayments(), // --> paymentsAndBillAndExpensesAndProvider
  ];

  List<Widget> accountAndRevenues = const [
    AllAccounts(),
    Revenues(),
    DebtsPatient(),
  ];

  List<Widget> paymentsAndBillAndExpensesAndProvider = const [
    AllPayments(),
    IncompleteBill(),
    Expenses(),
    Provider(),
  ];

  void changeTreatmentIndex(int treatmentIndex) {
    treatmentindex = treatmentIndex;
    emit(ChangeTreatmentState());
  }

  void changeCheckBox() {
    checkBoxValue = !checkBoxValue;
    emit(ChangeCheckBoxState());
  }

  void changeToothOrGum(String toothorgum) {
    toothOrGum = toothorgum;
    emit(ChangeToothOrGumState());
  }

  List<Widget> treatmentsScreens = [
    const TreatmentsPlansScreen(),
    const CompleteTreatmentsScreen(),
  ];
}
