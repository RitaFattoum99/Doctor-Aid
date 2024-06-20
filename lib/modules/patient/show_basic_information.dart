import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBasicInformation extends StatelessWidget {
  final PatientData patientData;

  const ShowBasicInformation({super.key, required this.patientData});
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController habitsController = TextEditingController();
    TextEditingController genderController = TextEditingController();

    void addBasicInformation(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 30),
                  child: Text(
                    'إضافة مريض',
                    style: TextStyle(
                      fontSize: 18,
                      color: simpleDialogTitleColor,
                    ),
                  ),
                ),
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: 500,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddAttachmentField(
                                  type: TextInputType.text,
                                  controller: fullNameController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل الاسم الكامل المريض';
                                    }
                                    return null;
                                  },
                                  label: 'اسم المريض '),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddAttachmentField(
                                  type: TextInputType.number,
                                  controller: phoneNumberController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل رقم المريض';
                                    }
                                    return null;
                                  },
                                  label: 'رقم المريض '),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddTreatmentFormField(
                                  type: TextInputType.emailAddress,
                                  controller: emailController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل البريد الإلكتروني';
                                    }
                                    return null;
                                  },
                                  label: ' البريد الإلكتروني للمريض'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddTreatmentFormField(
                                  type: TextInputType.text,
                                  controller: addressController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل عنوان المريض';
                                    }
                                    return null;
                                  },
                                  label: 'العنوان'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddTreatmentFormField(
                                  type: TextInputType.number,
                                  controller: ageController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل عمر المريض';
                                    }
                                    return null;
                                  },
                                  label: 'العمر'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddTreatmentFormField(
                                  type: TextInputType.text,
                                  controller: habitsController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل عادات المريض';
                                    }
                                    return null;
                                  },
                                  label: 'العادات'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              ),
                            ),
                            margin: const EdgeInsetsDirectional.only(start: 20),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 15),
                              child: AddTreatmentFormField(
                                  type: TextInputType.emailAddress,
                                  controller: genderController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'رجاءً ادخل جنس المريض';
                                    }
                                    return null;
                                  },
                                  label: 'الجنس'),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 45,
                              width: 200,
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'تأكيد الإضافة',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 175.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'اسم المريض',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                        SizedBox(
                          width: 335,
                        ),
                        Text(
                          'عمر المريض',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ItemBasicInformation(
                          text: patientData.fullName ?? '',
                        ),
                        const Spacer(),
                        ItemBasicInformation(
                          text: patientData.age.toString(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          'عنوان المريض',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                        SizedBox(
                          width: 335,
                        ),
                        Text(
                          'رقم الهاتف',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ItemBasicInformation(
                          text: patientData.address ?? '',
                        ),
                        const Spacer(),
                        ItemBasicInformation(
                          text: patientData.phoneNumber ?? '',
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'البريد الإلكتروني ',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                        SizedBox(
                          width: 315,
                        ),
                        Text(
                          'جنس المريض',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ItemBasicInformation(
                          text: patientData.email ?? '',
                        ),
                        const Spacer(),
                        ItemBasicInformation(
                          text: patientData.gender ?? '',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          'عادات المريض',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                        SizedBox(
                          width: 335,
                        ),
                        Text(
                          'تاريخ الميلاد',
                          style: TextStyle(fontSize: 24, color: fontColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ItemBasicInformation(
                          text: patientData.habits ?? '',
                        ),
                        const Spacer(),
                        ItemBasicInformation(
                          text: patientData.birthDate.toString(),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        addBasicInformation(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Container(
                          height: 45,
                          width: 230,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'إضافة مريض جديد',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
