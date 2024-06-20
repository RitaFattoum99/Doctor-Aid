import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBasicInformation extends StatelessWidget {
  final TextEditingController patientName = TextEditingController();
  final TextEditingController patientAge = TextEditingController();
  final TextEditingController patientAddress = TextEditingController();
  final TextEditingController patientPhoneNumber = TextEditingController();

  ShowBasicInformation({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController details = TextEditingController();

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
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 1,
                                  ),
                                ),
                                margin:
                                    const EdgeInsetsDirectional.only(start: 20),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 15),
                                  child: AddTreatmentFormField(
                                      // imagePath: 'images/tooth_icon.svg',
                                      //SvgIconData('images/vector.svg',) ,
                                      //SvgIconData('images/vector.svg',),
                                      type: TextInputType.emailAddress,
                                      controller: details,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter your email address';
                                        }
                                        return null;
                                      },
                                      label: 'اسم المرفق'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 1,
                                  ),
                                ),
                                margin:
                                    const EdgeInsetsDirectional.only(start: 20),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 15),
                                  child: AddAttachmentField(
                                      // imagePath: 'images/tooth_icon.svg',
                                      //SvgIconData('images/vector.svg',) ,
                                      //SvgIconData('images/vector.svg',),
                                      type: TextInputType.emailAddress,
                                      controller: details,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please Enter your email address';
                                        }
                                        return null;
                                      },
                                      label: 'رفع المرفق'),
                                ),
                              ),
                            ],
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
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child: ClinicFormField(
                            type: TextInputType.emailAddress,
                            controller: patientName,
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
                            controller: patientAge,
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
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child: ClinicFormField(
                            type: TextInputType.emailAddress,
                            controller: patientAddress,
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
                            type: TextInputType.phone,
                            controller: patientPhoneNumber,
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
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
