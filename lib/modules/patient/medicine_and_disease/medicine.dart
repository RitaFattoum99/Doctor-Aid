import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit,DrAidStates>(

      listener: (context,state){

      },
      builder: (context,state){
        return Column(
          children: [
            const SizedBox(height: 15,),
            const Row(
              children: [

                Text('الأدوية التي يأخذها المريض',style: TextStyle(
                    fontSize: 24,
                    color: fontColor
                ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.55, // Specify the width of the container
                  height: 200, // Specify the height of the container
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor, // Set the border color
                      width: 2, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(10), // Apply a circular border radius
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' .  باراسيتامول',style: TextStyle(
                            fontSize: 20,
                            color:fontColor,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' .  أنسولين',style: TextStyle(
                            fontSize: 20,
                            color:fontColor,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(' .  دوا أحمر',style: TextStyle(
                            fontSize: 20,
                            color:fontColor,
                          ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )


            // SizedBox(height: 15,),
            // Row(
            //   children: [
            //     Container(
            //       height: 50,
            //       width: 400,
            //       margin: EdgeInsets.only(left: 20),
            //       child:      ClinicFormField(
            //
            //
            //           type: TextInputType.emailAddress,
            //           controller: PatientName,
            //           validate: ( value)
            //           {
            //             if(value!.isEmpty)
            //             {
            //               return 'Please Enter your email address';
            //             }
            //           },
            //           label: 'الرجاء تعبئة الحقل'
            //       ),
            //     ),
            //     Spacer(),
            //     Container(
            //       height: 50,
            //       width: 400,
            //       margin: EdgeInsets.only(left: 20),
            //       child:      ClinicFormField(
            //
            //
            //           type: TextInputType.emailAddress,
            //           controller: PatientAge,
            //           validate: ( value)
            //           {
            //             if(value!.isEmpty)
            //             {
            //               return 'Please Enter your email address';
            //             }
            //           },
            //           label: 'الرجاء تعبئة الحقل'
            //       ),
            //     ),
            //
            //   ],
            // ),
            // SizedBox(height: 10,),
            // Row(
            //   children: [
            //     Text('عنوان المريض',style: TextStyle(
            //         fontSize: 24,
            //         color: fontColor
            //     ),
            //     ),
            //     SizedBox(width: 335,),
            //     Text('رقم الهاتف',style: TextStyle(
            //         fontSize: 24,
            //         color: fontColor
            //     ),
            //     ),
            //
            //   ],
            // ),
            // SizedBox(height: 15,),
            // Row(
            //   children: [
            //     Container(
            //       height: 50,
            //       width: 400,
            //       margin: EdgeInsets.only(left: 20),
            //       child:      ClinicFormField(
            //
            //
            //           type: TextInputType.emailAddress,
            //           controller: PatientAddress,
            //           validate: ( value)
            //           {
            //             if(value!.isEmpty)
            //             {
            //               return 'Please Enter your email address';
            //             }
            //           },
            //           label: 'الرجاء تعبئة الحقل'
            //       ),
            //     ),
            //     Spacer(),
            //     Container(
            //       height: 50,
            //       width: 400,
            //       margin: EdgeInsets.only(left: 20),
            //       child:      ClinicFormField(
            //
            //
            //           type: TextInputType.phone,
            //           controller: PatientPhoneNumber,
            //           validate: ( value)
            //           {
            //             if(value!.isEmpty)
            //             {
            //               return 'Please Enter your email address';
            //             }
            //           },
            //           label: 'الرجاء تعبئة الحقل'
            //       ),
            //     ),
            //
            //   ],
            // ),
          ],
        );
      },
    );


  }
}
