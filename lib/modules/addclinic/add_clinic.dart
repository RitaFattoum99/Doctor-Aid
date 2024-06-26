// ignore_for_file: avoid_print

import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClinicScreen extends StatefulWidget {
  const AddClinicScreen({super.key});

  @override
  State<AddClinicScreen> createState() => _AddClinicScreenState();
}

class _AddClinicScreenState extends State<AddClinicScreen> {
  int index = 0;

  bool isExpanded = true;
  TextEditingController clinicName = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController telephoneNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController whatsAppNumber = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController ownerAddress = TextEditingController();
  TextEditingController ownerPhone = TextEditingController();

  Widget buildAddClinicItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 175.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 550,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'اسم العيادة',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                  SizedBox(
                    width: 335,
                  ),
                  Text(
                    'عنوان العيادة',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.text,
                        controller: clinicName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل اسم عيادتك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.text,
                        controller: clinicAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل عنوان عيادتك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'اسم الطبيب المالك',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                  SizedBox(
                    width: 260,
                  ),
                  Text(
                    'عنوان الطبيب المالك',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.text,
                        controller: ownerName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل اسم الطبيب المالك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.text,
                        controller: ownerAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل عنوان الطبيب المالك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'البريد الإلكتروني للطبيب',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                  SizedBox(
                    width: 215,
                  ),
                  Text(
                    'رقم الطبيب المالك',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.emailAddress,
                        controller: userEmail,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل بريداَ إلكترونياَ للطبيب المالك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 400,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.number,
                        controller: ownerPhone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل رقم الطبيب المالك';
                          }
                          return null;
                        },
                        label: 'الرجاء تعبئة الحقل'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    ' معلومات التواصل بالعيادة',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.number,
                        controller: whatsAppNumber,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل رقم Whatsapp لعيادتك';
                          }
                          return null;
                        },
                        label: 'Whatsapp'),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.emailAddress,
                        controller: phoneNumber,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل رقم جوال لعيادتك';
                          }
                          return null;
                        },
                        label: 'Call'),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    margin: const EdgeInsets.only(left: 20),
                    child: ClinicFormField(
                        type: TextInputType.number,
                        controller: telephoneNumber,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل رقم ثابت لعيادتك';
                          }
                          return null;
                        },
                        label: 'Line'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print("create clinic");

                  DrAidCubit.get(context).createClinic(
                      //TODO: pass token as variable
                      token:
                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                      name: clinicName.text,
                      address: clinicAddress.text,
                      telePhoneNumber: telephoneNumber.text,
                      phoneNumber: phoneNumber.text,
                      whatsappNumber: whatsAppNumber.text,
                      ownerName: ownerName.text,
                      userEmail: userEmail.text,
                      ownerAddress: ownerAddress.text,
                      ownerPhone: ownerPhone.text);
                  print("name: ${clinicName.text}");
                  print("owner name: ${ownerName.text}");

                  // DrAidCubit.get(context).createPatient(
                  //   // TODO: pass token as variable
                  //   clinicId: 13,
                  //   token:
                  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //   fullName: "rita fattoum",
                  //   phoneNumber: "+963965214783",
                  //   email: "rita@gmail.com",
                  //   address: "برزة البلد",
                  //   age: "25",
                  //   habits: "_",
                  //   gender: "F",
                  //   birthDate: DateTime.now(),
                  // );

                  // DrAidCubit.get(context).createMedicine(
                  //   //TODO: pass token as variable
                  //   //TODO: pass patientId
                  //   token:
                  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //   patientId: 1,
                  //   medicationList: 'medicationList',
                  //   allergyList: 'allergyList',
                  // );

                  // DrAidCubit.get(context).createDisease(
                  //     //TODO: pass token as variable
                  //     //TODO: pass patientId
                  //   token:
                  // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //   patientId: 1,
                  //   diseaseList: 'diseaseList',
                  //   notes: 'notes',
                  // );

                  // DrAidCubit.get(context).createComplaint(
                  //   //TODO: pass token as variable
                  //   //TODO: pass patientId
                  //   token:
                  //        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //   patientId: 1,
                  //   complaintText: 'complaintText',
                  //   consultation: 'consultation',
                  // );

                  // DrAidCubit.get(context).createTreatment(
                  //     //TODO: pass token as variable
                  //     //TODO: pass clinicId
                  //     token:
                  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //     clinicId: 18,
                  //     title: 'title',
                  //     category: 'category',
                  //     description: 'description',
                  //     defaultCost: 20000,
                  //     color: "green");

                  // DrAidCubit.get(context).createTreatmentPlan(
                  //     //TODO: pass token as variable
                  //     //TODO: pass patientId
                  //     token:
                  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                  //     patientId: 1,
                  //     discount: 0.02,
                  //     sessionNumber: 2,
                  //     totalCost: 100000,);


                        DrAidCubit.get(context).createCompletedTreatment(
                      //TODO: pass token as variable
                      //TODO: pass patientId
                      token:
                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ",
                      patientId: 1,
                    treatmentId: 1,
                    fromTeeth: 5,
                    toTeeth: 6,
                    place: "tooth",
                    notes: "لا يوجد أية اختلاطات ",
                    );
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: buttonColor),
                  child: const Center(
                    child: Text(
                      'إضافة عيادة',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddClinic(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 700,
          color: coolWhite2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'إضافة عيادة جديدة',
                      style: TextStyle(fontSize: 28, color: blueText),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                buildAddClinicItem(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: coolWhite2,
          appBar: const CustomAppBar(),
          body: Row(
            children: [const SideBarScreen(), buildAddClinic(context)],
          ),
        );
      },
    );
  }
}
