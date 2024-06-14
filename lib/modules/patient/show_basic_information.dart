import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShowBasicInformation extends StatelessWidget {

  final TextEditingController patientName=TextEditingController();
  final TextEditingController patientAge=TextEditingController();
  final TextEditingController patientAddress=TextEditingController();
  final TextEditingController patientPhoneNumber=TextEditingController();

  ShowBasicInformation({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DrAidCubit,DrAidStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return    Padding(
          padding: const EdgeInsetsDirectional.only(end: 175.0),
          child: Container(
            width:MediaQuery.of(context).size.width*0.6,
            height:400,

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('اسم المريض',style: TextStyle(
                          fontSize: 24,
                          color: fontColor
                      ),
                      ),
                      SizedBox(width: 335,),
                      Text('عمر المريض',style: TextStyle(
                          fontSize: 24,
                          color: fontColor
                      ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child:      ClinicFormField(


                            type: TextInputType.emailAddress,
                            controller: patientName,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your email address';
                              }
                              return null;
                            },
                            label: 'الرجاء تعبئة الحقل'
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child:      ClinicFormField(


                            type: TextInputType.emailAddress,
                            controller: patientAge,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your email address';
                              }
                              return null;
                            },
                            label: 'الرجاء تعبئة الحقل'
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text('عنوان المريض',style: TextStyle(
                          fontSize: 24,
                          color: fontColor
                      ),
                      ),
                      SizedBox(width: 335,),
                      Text('رقم الهاتف',style: TextStyle(
                          fontSize: 24,
                          color: fontColor
                      ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child:      ClinicFormField(


                            type: TextInputType.emailAddress,
                            controller: patientAddress,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your email address';
                              }
                              return null;
                            },
                            label: 'الرجاء تعبئة الحقل'
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 400,
                        margin: const EdgeInsets.only(left: 20),
                        child:      ClinicFormField(


                            type: TextInputType.phone,
                            controller: patientPhoneNumber,
                            validate: ( value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please Enter your email address';
                              }
                              return null;
                            },
                            label: 'الرجاء تعبئة الحقل'
                        ),
                      ),

                    ],
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
