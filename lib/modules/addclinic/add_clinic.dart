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
  TextEditingController ownerName = TextEditingController();
  TextEditingController ownerAddress = TextEditingController();
  TextEditingController clinicAddress = TextEditingController();
  TextEditingController telephoneNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController whatsAppNumber = TextEditingController();

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
                    'اسم الطبيب المالك',
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
                        type: TextInputType.emailAddress,
                        controller: clinicName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                        type: TextInputType.emailAddress,
                        controller: ownerName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                    'عنوان المالك',
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
                        type: TextInputType.emailAddress,
                        controller: ownerAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                        type: TextInputType.emailAddress,
                        controller: clinicAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                    'كلمة المرور',
                    style: TextStyle(fontSize: 24, color: fontColor),
                  ),
                  SizedBox(
                    width: 335,
                  ),
                  Text(
                    'تأكيد كلمة المرور',
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
                        controller: clinicName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                        type: TextInputType.emailAddress,
                        controller: clinicName,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                    'معلومات التواصل',
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
                        type: TextInputType.emailAddress,
                        controller: whatsAppNumber,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                            return 'Please Enter your email address';
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
                        type: TextInputType.emailAddress,
                        controller: telephoneNumber,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your email address';
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
                  print(5);
                   // DrAidCubit.get(context).addClinic(
                   //     name: 'testfgv555665',
                   //     token: 'test',
                   //     address: 'address',
                   //     telePhoneNumber: 'telePhoneNumber',
                   //     phoneNumber: 'phoneNumber',
                   //     whatsappNumber: 'whatsappNumber',
                   //     ownerName: 'ownerName',
                   //     ownerAddress: 'ownerAddress',
                   //     ownerPhone: 'ownerPhone'
                   // );
                  // DrAidCubit.get(context).createPatient(
                  //     address: 'address',
                  //     age: 'age',
                  //     email: 'email',
                  //     phoneNumber: 'phoneNumber',
                  //     fullName: 'LL',
                  //     habits: 'habits',
                  //     gender: 'gender'
                  // );

                  // DrAidCubit.get(context).createMedicine(
                  //     patientId: 1,
                  //     medicationList: 'medicationList',
                  //     allergyList: 'allergyList',
                  // );

                  DrAidCubit.get(context).createDisease(
                      patientId: 1,
                      diseseList: 'diseseList',
                      notes: 'notes',
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
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'إضافة عيادة جديدة',
                      style: TextStyle(fontSize: 28, color: Colors.black),
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
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    'images/dental_logo1.png',
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dental Care',
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontSize: 28,
                      // fontWeight: FontWeight.bold
                    ),
                  ),

                  // SvgPicture.asset(
                  //   'images/dental_logo.svg', // replace with the actual SVG file name and extension
                  //   width: 20, // optional, sets the width of the icon
                  //   height: 20, // optional, sets the height of the icon
                  //   color: Colors.grey, // optional, sets the color of the icon
                  // )// optional, sets the color of the icon

                  // NavBar(),
                ],
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20, top: 5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgXMB05f5uqY5HFXRymjfYv7eevihHiipha3H8-4IQQxpAu9QQ8JCr770qcU29C9zECDs&usqp=CAU'),
                  radius: 30,
                ),
              ),
            ],
          ),
          body: Row(
            children: [const SideBarScreen(), buildAddClinic(context)],
          ),
        );
      },
    );
  }
}
