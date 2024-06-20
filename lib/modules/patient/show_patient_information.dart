// ignore_for_file: deprecated_member_use
import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/models/create_patient.dart';
import 'package:draid/modules/dental_anatomy/dentalanatomy.dart';
import 'package:draid/modules/patient/middle_bar.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientInformation extends StatelessWidget {
  final PatientData patientData;

  const PatientInformation({super.key, required this.patientData});

  @override
  Widget build(BuildContext context) {
    // DrAidCubit.get(context).bottomPatientscreens = [
    //   ShowBasicInformation(patientData: patientData),
    //   MedicinesAndDiseases(),
    //   TreatmentsInformation(),
    //   const AttachmentsScreen(),
    // ];
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 700,
          color: coolWhite2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 20, end: 130),
                  child: Row(
                    children: [
                      const Text(
                        'عرض معلومات مريض',
                        style: TextStyle(fontSize: 28, color: blueText),
                      ),
                      const Spacer(),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: coolGreen1,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: InkWell(
                          onTap: () {
                            navigateTo(context, const ToothChart());
                          },
                          child: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 30),
                            child: Row(children: [
                              SvgPicture.asset(
                                'images/tooth_icon.svg',
                                // '$imagePath',
                                //   semanticsLabel: 'My SVG Image',
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'حالة المريض',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const MiddleBar(
                  texts: [
                    'المعلومات الأساسية',
                    'الأدوية و الأمراض',
                    'المعالجات',
                    'المرفقات'
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DrAidCubit.get(context)
                    .bottomPatientscreens[DrAidCubit.get(context).currentindex],
              ],
            ),
          ),
        );
      },
    );
  }
}
