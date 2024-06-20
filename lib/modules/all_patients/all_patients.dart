import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/patient/show_basic_information.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPatients extends StatefulWidget {
  const AllPatients({super.key});

  @override
  State<AllPatients> createState() => _AllPatientsState();
}

class _AllPatientsState extends State<AllPatients> {
  @override
  void initState() {
    super.initState();
    final cubit = DrAidCubit.get(context);
    cubit.getAllPatients(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZnVsbE5hbWUiOiLYo9it2YXYryDYtNmK2K4g2KfZhNi02KjYp9ioIiwicm9sZXMiOlsiYWRtaW4iXSwiaWF0IjoxNzE4NjA0NjE2fQ.hlL_f3ls3XTsO8S1TJB5a-7y1M8SWQe2IbQ5d0DM-is',
      clinicId: 18,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DrAidAllPatientSuccessState) {
          final patients = state.allPatientsModel.patientDataList;

          return Scaffold(
            backgroundColor: coolWhite2,
            appBar: const CustomAppBar(),
            body: Row(
              children: [
                const SideBarScreen(),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: 700,
                      color: coolWhite2,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 20, end: 130),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: const Image(
                                      image: AssetImage('images/arrow.png'),
                                      width: 30,
                                      height: 20,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                  const Text(
                                    'المرضى',
                                    style: TextStyle(
                                        fontSize: 28, color: blueText),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    child: SizedBox(
                                      width: 200,
                                      child: CustomSearchField(
                                        icon: Icons.search,
                                        hintText: 'بحث عن مريض',
                                        controller: TextEditingController(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 60),
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 175.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                height: 450,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 18),
                                    const Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 30),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 15),
                                          Text(
                                            'اسم المريض',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                          SizedBox(width: 70),
                                          Text(
                                            'العمر',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                          SizedBox(width: 70),
                                          Text(
                                            'الجنس',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                          SizedBox(width: 80),
                                          Text(
                                            'السكن',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                          SizedBox(width: 80),
                                          Text(
                                            'الملف الشخصي',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                          SizedBox(width: 57),
                                          Text(
                                            'الخيارات',
                                            style: TextStyle(
                                                fontSize: 18, color: fontColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          width: 900,
                                          height: 1,
                                          color: dividerColor,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Expanded(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          final patient = patients[index];
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 30),
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 30),
                                                Text(
                                                  patient.fullName ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(width: 75),
                                                Text(
                                                  patient.age?.toString() ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(width: 85),
                                                Text(
                                                  patient.gender ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(width: 90),
                                                Text(
                                                  patient.address ?? '',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(width: 80),
                                                Container(
                                                  width: 130,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: coolGreen1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                ShowBasicInformation(
                                                              // patientId:
                                                              //     patient.id!,
                                                              patientData:
                                                                  patient,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: const Center(
                                                        child: Text(
                                                          '  عرض الملف الشخصي  ',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: white,
                                                          ),
                                                        ),
                                                      )),
                                                ),
                                                const SizedBox(width: 75),
                                                Container(
                                                  width: 70,
                                                  height: 40,
                                                  color: Colors.white,
                                                  child: const Center(
                                                    child: Row(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              'images/edit1.png'),
                                                          width: 25,
                                                          height: 25,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Image(
                                                          image: AssetImage(
                                                              'images/delete.png'),
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(height: 10);
                                        },
                                        itemCount: patients.length,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DrAidAllPatientErrorState) {
          return Center(child: Text('Error: ${state.errorMsg}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
