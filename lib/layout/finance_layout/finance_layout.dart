// ignore_for_file: deprecated_member_use
import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/finance/bill.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceLayout extends StatefulWidget {
  const FinanceLayout({super.key});

  @override
  State<FinanceLayout> createState() => _FinanceLayoutState();
}

class _FinanceLayoutState extends State<FinanceLayout> {
  int index = 0;

  int selectedIndex1 = 0;

  bool isExpanded = true;

  // var patientName = TextEditingController();
  // var patientAge = TextEditingController();
  // var patientAddress = TextEditingController();
  // var patientPhoneNumber = TextEditingController();
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

  // TextEditingController details = TextEditingController();

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
                    ),
                  ),
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
          body: const Row(
            children: [SideBarScreen(), Bill()],
          ),
        );
      },
    );
  }
}
