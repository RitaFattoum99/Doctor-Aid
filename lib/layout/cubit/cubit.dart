// ignore_for_file: avoid_print, deprecated_member_use

import 'package:dio/dio.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/create_attachment_model.dart';
import 'package:draid/models/create_complaint_model.dart';
import 'package:draid/models/create_disease_model.dart';
import 'package:draid/models/create_medication_model.dart';
import 'package:draid/models/create_patient.dart';
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
    required String attachments,
    required String token,
  }) {
    // Log the request data
    print("Sending request to create attachments with data:");
    print({
      'PatientId': patientId,
      'title': title,
      'attachments': attachments,
      "token": token,
    });
    DioHelper.postData(
            url: '$patient/$patientId/$attachments',
            data: {
              'title': title,
              'attachments': attachments,
            },
            token: token)
        .then((value) {
      print("Response status: ${value.statusCode}");
      print("Response data: ${value.data}");

      if (value.data != null) {
        createAttachmentModel = CreateAttachmentModel.fromJson(value.data);

        print("status: ${createAttachmentModel?.status}");
        print(createAttachmentModel?.attachmentData);
        print(createAttachmentModel?.message);
        print("title: ${createAttachmentModel?.attachmentData[1].title}");
        print("url: ${createAttachmentModel?.attachmentData[1].url}");
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
