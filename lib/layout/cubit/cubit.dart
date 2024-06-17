// ignore_for_file: avoid_print

import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/add_clinic_model.dart';
import 'package:draid/models/create_disease_model.dart';
import 'package:draid/models/create_medication_model.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/models/user_model.dart';
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

  void login({
    required String email,
    required String password,
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
      // print(token);
      print(addClinicModel?.status);
      print(addClinicModel?.clinicData);
      print(addClinicModel?.message);
      addClinicModel = AddClinicModel.fromJson(value.data);

      print(addClinicModel?.clinicData.ownerName);

      // addClinicModel.clinicData.

      //print(value.data);
      //createGroupModel= CreateGroupModel.fromJson(value.data);
      // if(loginModel==null){ emit(LoginDatanullErrorState(loginModel));}
      //else {emit(LoginSuccessState(loginModel));}

      //  emit(LoginSuccessState(loginModel));
      //emit(CreateGroupSuccessState(createGroupModel));
      // print(createGroupModel.status);
      // print(createGroupModel.result.id);
      // print(createGroupModel.result.name);

      //  emit(LoginLoadingState());

      // print(loginModel.status);

      // print(loginModel.data.name);
    });
  }

  void createPatient({
    required String address,
    required String age,
    required String email,
    required String phoneNumber,
    required String fullName,
    required String habits,
    required String gender,
    // required DateTime birthDate,
  }) {
    DioHelper.postData(
            url: patient,
            data: {
              'address': address,
              'age': age,
              'email': email,
              'phoneNumber': phoneNumber,
              'fullName': fullName,
              'habits': habits,
              'gender': gender,
              // 'birthDate':birthDate,
            },
            token:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0FkbWluIjp0cnVlLCJpZCI6MTUsImlhdCI6MTcwNTA5MTM1Mn0.1qs_WXlcjeFc3-Re7WWjsgkHmNEyYzI0TjsS7-q8pnw')
        .then((value) {
      // print(token);
      print(createPatientModel?.status);
      createPatientModel = CreatePatientModel.fromJson(value.data);

      print(createPatientModel?.data.fullName);
    });
  }

  void createMedicine({
    required int patientId,
    required String medicationList,
    required String allergyList,
  }) {
    DioHelper.postData(
            url: medication,
            data: {
              'PatientId': patientId,
              'medicationList': medicationList,
              'allergyList': allergyList,
            },
            token:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0FkbWluIjp0cnVlLCJpZCI6MTUsImlhdCI6MTcwNTA5MTM1Mn0.1qs_WXlcjeFc3-Re7WWjsgkHmNEyYzI0TjsS7-q8pnw')
        .then((value) {
      // print(token);
      print(createMedicationModel?.status);
      createMedicationModel = CreateMedicationModel.fromJson(value.data);

      print(createMedicationModel?.data.medicationList);
    });
  }

  void createDisease({
    required int patientId,
    required String diseseList,
    required String notes,
  }) {
    DioHelper.postData(
            url: disease,
            data: {
              'PatientId': patientId,
              'diseseList': diseseList,
              'notes': notes,
            },
            token:
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc0FkbWluIjp0cnVlLCJpZCI6MTUsImlhdCI6MTcwNTA5MTM1Mn0.1qs_WXlcjeFc3-Re7WWjsgkHmNEyYzI0TjsS7-q8pnw')
        .then((value) {
      // print(token);
      print(createDiseaseModel?.status);
      createDiseaseModel = CreateDiseaseModel.fromJson(value.data);

      print(createDiseaseModel?.data.notes);
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
