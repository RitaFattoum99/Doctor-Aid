import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/patient/show_patient_information.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientInformationLayout extends StatefulWidget {
  const PatientInformationLayout({super.key});

  @override
  State<PatientInformationLayout> createState() =>
      _PatientInformationLayoutState();
}

class _PatientInformationLayoutState extends State<PatientInformationLayout> {
  int index = 0;

  int selectedIndex1 = 0;

  bool isExpanded = true;

  var patientName = TextEditingController();
  var patientAge = TextEditingController();
  var patientAddress = TextEditingController();
  var patientPhoneNumber = TextEditingController();
  // Widget buildContainer(context, int index) {
  //   if (index == 0) {
  //     return InkWell(
  //       onTap: () {
  //         setState(() {
  //           selectedIndex1 = index;
  //         });
  //       },
  //       child: Container(
  //         width: 246,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: selectedIndex1 == index ? buttonColor : Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Container(
  //                 width: 30,
  //                 height: 30,
  //                 decoration: BoxDecoration(
  //                   color: selectedIndex1 == index
  //                       ? Colors.white
  //                       : numberBackGroundColor,
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     '1',
  //                     style: TextStyle(fontSize: 20, color: fontColor2),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               Text(
  //                 'المعلومات الأساسية',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color:
  //                         selectedIndex1 == index ? Colors.white : fontColor2),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (index == 1) {
  //     return InkWell(
  //       onTap: () {
  //         setState(() {
  //           selectedIndex1 = index;
  //         });
  //       },
  //       child: Container(
  //         width: 246,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: selectedIndex1 == index ? buttonColor : Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Container(
  //                 width: 30,
  //                 height: 30,
  //                 decoration: BoxDecoration(
  //                   color: selectedIndex1 == index
  //                       ? Colors.white
  //                       : numberBackGroundColor,
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     '2',
  //                     style: TextStyle(fontSize: 20, color: fontColor2),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               Text(
  //                 'الأدوية و الأمراض',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color:
  //                         selectedIndex1 == index ? Colors.white : fontColor2),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (index == 2) {
  //     return InkWell(
  //       onTap: () {
  //         setState(() {
  //           selectedIndex1 = index;
  //         });
  //       },
  //       child: Container(
  //         width: 246,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: selectedIndex1 == index ? buttonColor : Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Container(
  //                 width: 30,
  //                 height: 30,
  //                 decoration: BoxDecoration(
  //                   color: selectedIndex1 == index
  //                       ? Colors.white
  //                       : numberBackGroundColor,
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     '3',
  //                     style: TextStyle(fontSize: 20, color: fontColor2),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               Text(
  //                 'المعالجات',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color:
  //                         selectedIndex1 == index ? Colors.white : fontColor2),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (index == 3) {
  //     return InkWell(
  //       onTap: () {
  //         setState(() {
  //           selectedIndex1 = index;
  //         });
  //       },
  //       child: Container(
  //         width: 246,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: selectedIndex1 == index ? buttonColor : Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(10),
  //           child: Row(
  //             children: [
  //               const SizedBox(
  //                 width: 10,
  //               ),
  //               Container(
  //                 width: 30,
  //                 height: 30,
  //                 decoration: BoxDecoration(
  //                   color: selectedIndex1 == index
  //                       ? Colors.white
  //                       : numberBackGroundColor,
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 child: const Center(
  //                   child: Text(
  //                     '4',
  //                     style: TextStyle(fontSize: 20, color: fontColor2),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 width: 15,
  //               ),
  //               Text(
  //                 'المرفقات',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color:
  //                         selectedIndex1 == index ? Colors.white : fontColor2),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return const SizedBox(
  //       width: 10,
  //     );
  //   }
  // }

  // Widget buildShowBasicPatientInformation(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsetsDirectional.only(end: 175.0),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.6,
  //       height: 400,
  //       decoration: BoxDecoration(
  //           color: Colors.white, borderRadius: BorderRadius.circular(30)),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           children: [
  //             const Row(
  //               children: [
  //                 Text(
  //                   'اسم المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //                 SizedBox(
  //                   width: 335,
  //                 ),
  //                 Text(
  //                   'عمر المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientName,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //                 const Spacer(),
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientAge,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             const Row(
  //               children: [
  //                 Text(
  //                   'عنوان المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //                 SizedBox(
  //                   width: 335,
  //                 ),
  //                 Text(
  //                   'رقم الهاتف',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientAddress,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //                 const Spacer(),
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.phone,
  //                       controller: patientPhoneNumber,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget medicinesanddiseases(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsetsDirectional.only(end: 175.0),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.6,
  //       height: 400,
  //       decoration: BoxDecoration(
  //           color: Colors.white, borderRadius: BorderRadius.circular(30)),
  //       child: Padding(
  //         padding: const EdgeInsets.all(30.0),
  //         child: Column(
  //           children: [
  //             const Row(
  //               children: [
  //                 Text(
  //                   'الأدوية التي يأخذها المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //                 SizedBox(
  //                   width: 335,
  //                 ),
  //                 Text(
  //                   'عمر المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientName,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //                 const Spacer(),
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientAge,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             const Row(
  //               children: [
  //                 Text(
  //                   'عنوان المريض',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //                 SizedBox(
  //                   width: 335,
  //                 ),
  //                 Text(
  //                   'رقم الهاتف',
  //                   style: TextStyle(fontSize: 24, color: fontColor),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 15,
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.emailAddress,
  //                       controller: patientAddress,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //                 const Spacer(),
  //                 Container(
  //                   height: 50,
  //                   width: 400,
  //                   margin: const EdgeInsets.only(left: 20),
  //                   child: ClinicFormField(
  //                       type: TextInputType.phone,
  //                       controller: patientPhoneNumber,
  //                       validate: (value) {
  //                         if (value!.isEmpty) {
  //                           return 'Please Enter your email address';
  //                         }
  //                         return null;
  //                       },
  //                       label: 'الرجاء تعبئة الحقل'),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget middleBar(BuildContext context) {
  //   return Row(
  //     children: [
  //       Container(
  //         width: MediaQuery.of(context).size.width * 0.65,
  //         height: 50,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             SizedBox(
  //               width: MediaQuery.of(context).size.width * 0.65,
  //               child: ListView.separated(
  //                   scrollDirection: Axis.horizontal,
  //                   itemBuilder: (context, index) =>
  //                       buildContainer(context, index),
  //                   separatorBuilder: (context, index) => const SizedBox(
  //                         width: 5,
  //                       ),
  //                   itemCount: 4),
  //             ),

  //             //List.generate(4, (index1) => buildContainer(index1)),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget buildShowPatientInformation(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Container(
  //         width: MediaQuery.of(context).size.width * 0.8,
  //         height: 700,
  //         color: coolWhite2,
  //         child: Padding(
  //           padding: const EdgeInsets.all(30.0),
  //           child: Column(
  //             children: [
  //               const Row(
  //                 children: [
  //                   Text(
  //                     'عرض معلومات مريض',
  //                     style: TextStyle(fontSize: 28, color: Colors.black),
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(
  //                 height: 40,
  //               ),
  //               middleBar(context),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               buildShowBasicPatientInformation(context),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: coolWhite2,
          appBar: CustomAppBar(),
          body: Row(
            children: [SideBarScreen(), PatientInformation()],
          ),
        );
      },
    );
  }
}
