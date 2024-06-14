

import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AttachmentsScreen extends StatelessWidget {
  const AttachmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController details=TextEditingController();



    void addNewAttachment(BuildContext context){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 30),
                  child: Text('إضافة مرفق جديد',style:
                  TextStyle(
                    fontSize: 18,
                    color: simpleDialogTitleColor,
                  ),
                  ),
                ),
                children:<Widget> [
                  //if(apiResponse.data.isEmpty)
                  //Center(child: Text('No requests right now'),),

                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.30,
                    height: 250,

                    child:      Column(
                      children: [
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:  Border.all(
                                    color: borderColor, // Set the border color
                                    width: 1, // Set the border width

                                  ),

                                ),
                                margin: const EdgeInsetsDirectional.only(start: 20),
                                child:      Padding(
                                  padding: const EdgeInsetsDirectional.only(start:15),
                                  child: AddTreatmentFormField(
                                    // imagePath: 'images/tooth_icon.svg',
                                    //SvgIconData('images/vector.svg',) ,
                                    //SvgIconData('images/vector.svg',),
                                      type: TextInputType.emailAddress,

                                      controller: details,
                                      validate: ( value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return 'Please Enter your email address';
                                        }
                                        return null;
                                      },
                                      label: 'اسم المرفق'
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),


                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 400,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:  Border.all(
                                    color: borderColor, // Set the border color
                                    width: 1, // Set the border width

                                  ),

                                ),
                                margin: const EdgeInsetsDirectional.only(start: 20),
                                child:      Padding(
                                  padding: const EdgeInsetsDirectional.only(start:15),
                                  child: AddAttachmentField(
                                    // imagePath: 'images/tooth_icon.svg',
                                    //SvgIconData('images/vector.svg',) ,
                                    //SvgIconData('images/vector.svg',),
                                      type: TextInputType.emailAddress,
                                      suffixImagePath: 'images/pdf_image.svg',

                                      controller: details,
                                      validate: ( value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return 'Please Enter your email address';
                                        }
                                        return null;
                                      },
                                      label: 'رفع المرفق'
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),



                        // Expanded(
                        //   child: ListView.separated(
                        //     shrinkWrap: true,
                        //     itemBuilder: (context,index)=>Container(height: 50,width: 50,color: Colors.red,),
                        //     separatorBuilder: (context,index)=>Padding(
                        //       padding: const EdgeInsetsDirectional.only(start:30 ),
                        //       child: Container(height: 1,color: Colors.grey,),
                        //     ),
                        //     itemCount: 0,
                        //   ),
                        // ),
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            // treatmentPlanDetails(context);
                            // addNewTreatmentPlan(context);

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container( // Add your Container here
                              height: 45, // Specify the height of the new container
                              width: 200, // Make it take the full width
                              //  color: Colors.blue, // Example color
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(child: Text('تأكيد الإضافة', style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white
                              ),
                              ),
                              ),
                            ),
                          ),
                        ),




                      ],
                    ),


                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   itemBuilder: (context,index)=>Container(height: 50,width: 50,color: Colors.red,),
                    //   separatorBuilder: (context,index)=>Padding(
                    //     padding: const EdgeInsetsDirectional.only(start:30 ),
                    //     child: Container(height: 1,color: Colors.grey,),
                    //   ),
                    //   itemCount: 8,
                    // ),
                  ),




                ],

              ),
            );

          }
      );
    }



    return BlocConsumer<DrAidCubit,DrAidStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 175.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 450,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [

                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      width: 800,
                      height: 260,
                      color: Colors.white,
                      child:GridView.count(
                        crossAxisCount: 3, // Number of items per row
                        children: List<Widget>.generate(9, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: 200,
                              height: 260,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'images/pdf_image.svg',
                                      semanticsLabel: 'My SVG Image',
                                      height: 120,
                                      width: 120,
                                      //color: fontColor2,
                                    ),
                                    const SizedBox(height: 20,),

                                    const Text('تحليل الحساسية',
                                    style: TextStyle(
                                      fontSize: 26,
                                      color:buttonColor,

                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                            //treatmentPlanItem();
                        }),
                      ),









                      //       GridView.builder(
                      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 3,
                      //             childAspectRatio: 1, // Adjust this value to change the aspect ratio of the items
                      //           ),
                      //           itemBuilder:(context,index) {
                      //             return   Container(
                      //               margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      //               width: 100, // Specify the width of the container
                      //               height: 200, // Specify the height of the container
                      //               decoration: BoxDecoration(
                      //                 border: Border.all(
                      //                   color: borderColor, // Set the border color
                      //                   width: 2, // Set the border width
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(10), // Apply a circular border radius
                      //               ),
                      //               child: const Column(
                      //                 children: [
                      //                   SizedBox(height: 10,),
                      //                   Row(
                      //                     children: [
                      //                       Text(' .  باراسيتامول',style: TextStyle(
                      //                         fontSize: 20,
                      //                         color:fontColor,
                      //                       ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   SizedBox(height: 10,),
                      //                   Row(
                      //                     children: [
                      //                       Text(' .  أنسولين',style: TextStyle(
                      //                         fontSize: 20,
                      //                         color:fontColor,
                      //                       ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                   SizedBox(height: 10,),
                      //                   Row(
                      //                     children: [
                      //                       Text(' .  دوا أحمر',style: TextStyle(
                      //                         fontSize: 20,
                      //                         color:fontColor,
                      //                       ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ],
                      //               ),
                      //             );
                      //
                      //
                      //             //   Container(
                      //             //   margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      //             //   height: 20,
                      //             //   width: 5,
                      //             //   color: Colors.red,
                      //             // );
                      // }
                      //
                      //
                      //       ),


                      // ListView(
                      //   children: [
                      //     Container(
                      //       height: 50,
                      //       width: 10,
                      //       color: Colors.red,
                      //     ),
                      //     SizedBox(height: 10,),
                      //   ],
                      // ),

                    ),
                  ],
                ),

                //SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    // treatmentPlanDetails(context);
                  //  addNewTreatmentPlan(context);
                    //addPayment(context);
                    addNewAttachment(context);

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container( // Add your Container here
                      height: 45, // Specify the height of the new container
                      width: 230, // Make it take the full width
                      //  color: Colors.blue, // Example color
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(child: Text('إضافة مرفق جديد', style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                      ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );


        //   Column(
        //   children: [
        //     const SizedBox(height: 15,),
        //     const Row(
        //       children: [
        //
        //         Text('الأمراض المزمنة',style: TextStyle(
        //             fontSize: 24,
        //             color: fontColor
        //         ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(height: 20,),
        //     Row(
        //       children: [
        //         Container(
        //           width: MediaQuery.of(context).size.width*0.55, // Specify the width of the container
        //           height: 200, // Specify the height of the container
        //           decoration: BoxDecoration(
        //             border: Border.all(
        //               color: borderColor, // Set the border color
        //               width: 2, // Set the border width
        //             ),
        //             borderRadius: BorderRadius.circular(10), // Apply a circular border radius
        //           ),
        //           child: const Column(
        //             children: [
        //               SizedBox(height: 10,),
        //               Row(
        //                 children: [
        //                   Text(' .  داء السكري',style: TextStyle(
        //                     fontSize: 20,
        //                     color:fontColor,
        //                   ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 10,),
        //               Row(
        //                 children: [
        //                   Text(' .  داء الضغط',style: TextStyle(
        //                     fontSize: 20,
        //                     color:fontColor,
        //                   ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 10,),
        //               Row(
        //                 children: [
        //                   Text(' .  دوا أحمر',style: TextStyle(
        //                     fontSize: 20,
        //                     color:fontColor,
        //                   ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //
        //   ],
        // );


      },
    );


  }
}