import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg_icons/flutter_svg_icons.dart';
//import 'package:flutter_svg/flutter_svg.dart';



class TreatmentsPlansScreen extends StatelessWidget {
  const TreatmentsPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController details= TextEditingController();
    void treatmentPlanDetails(BuildContext context){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 80),
                  child: Text('تفاصيل الخطة العلاجية',style:
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
                    width: MediaQuery.of(context).size.width*0.25,

                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: 300,
                          margin: const EdgeInsets.only(left: 20),
                          child:      ClinicFormFieldDialog(
                            imagePath: 'images/tooth_icon.svg',






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
                              label: '12  سحب عصب              2500000'
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 300,
                          margin: const EdgeInsets.only(left: 20),
                          child:      ClinicFormFieldDialog(
                              imagePath: 'images/tooth_icon.svg',






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
                              label: '12  حشوة              2500000'
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          height: 50,
                          width: 300,
                          margin: const EdgeInsets.only(left: 20),
                          child:      ClinicFormFieldDialog(
                              imagePath: 'images/tooth_icon.svg',






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
                              label: '12  زراعة              2500000'
                          ),
                        ),
                       // SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: DrAidCubit.get(context).checkBoxValue,
                                onChanged: (bool? value) {
                                  DrAidCubit.get(context).changeCheckBox();
                                },
                                activeColor: Colors.green, // Color when checked
                                checkColor: Colors.white, // Color of the checkmark
                                shape: const RoundedRectangleBorder(
                                 // Adjust the border radius as needed
                                  side: BorderSide(color: fontColor2), // Set the border color and width
                                ),
                              ),
                              const SizedBox(width: 30,),
                              const Text('انهاء العلاج',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: fontColor2,
                                ),
                              ),
                            ],

                          ),
                        ),
                        InkWell(
                          onTap: (){
                           // treatmentPlanDetails(context);

                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container( // Add your Container here
                              height: 40, // Specify the height of the new container
                              width: 150, // Make it take the full width
                              //  color: Colors.blue, // Example color
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(child: Text('حفظ التعديلات', style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                              ),
                              ),
                            ),
                          ),
                        ),


                      ],
                    )

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
    void addTreatmentItem(BuildContext context){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 100),
                  child: Text('إضافة بند معالجة',style:
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
                    height: 500,

                    child:      Column(
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(start: 50),
                              child: Text('مكان العلاج',style:TextStyle(
                                  fontSize: 16,
                                  color: fontColor3
                              ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0),
                            width: 400, // Specify the width of the container
                            height: 50, // Specify the height of the container
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor, // Set the border color
                                width: 1, // Set the border width
                              ),
                              borderRadius: BorderRadius.circular(10), // Apply a circular border radius
                            ),
                            child: Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 40),
                                  child: Text(DrAidCubit.get(context).toothOrGum,style:const TextStyle(
                                    fontSize: 16,
                                    color: fontColor3,
                                  ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 30),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                                                    //    value: dropDownValue,
                                      icon: const Icon(Icons.arrow_drop_up),
                                        style: const TextStyle(color: Colors.black),
                                        items: const [
                                          DropdownMenuItem(
                                          value: 'سن',
                                          child: Text('سن'),
                                        ),
                                          DropdownMenuItem(
                                            value: 'لثة',
                                            child: Text('لثة'),
                                          ),

                                        ],
                                        onChanged: (String? newValue){
                                        DrAidCubit.get(context).changeToothOrGum(newValue!);

                                        }



                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ),
                        Row(
                          children: [
                          DrAidCubit.get(context).toothOrGum=='سن'? Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.only(start: 50),
                                  child: Text('رقم السن',style:TextStyle(
                                      fontSize: 16,
                                      color: fontColor3
                                  ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 180,
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
                                              label: 'أدخل رقم السن'
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      Checkbox(
                                        value: DrAidCubit.get(context).checkBoxValue,
                                        onChanged: (bool? value) {
                                          DrAidCubit.get(context).changeCheckBox();
                                        },
                                        activeColor: Colors.green, // Color when checked
                                        checkColor: Colors.white, // Color of the checkmark
                                        shape: const RoundedRectangleBorder(
                                          // Adjust the border radius as needed
                                          side: BorderSide(color: fontColor2), // Set the border color and width
                                        ),
                                      ),
                                      const SizedBox(width: 15,),
                                      const Text('أكثر من سن',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: fontColor2,
                                        ),
                                      ),




                                    ],
                                  ),
                                ),
                              ],
                            ):const SizedBox(width: 5,),
                          ],
                        ),

                        const SizedBox(height: 10,),
                       DrAidCubit.get(context).checkBoxValue!=false? Padding(
                          padding: const EdgeInsetsDirectional.only(start: 30),
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 180,
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
                                      label: 'من'
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                height: 40,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:  Border.all(
                                    color: borderColor, // Set the border color
                                    width: 1, // Set the border width

                                  ),

                                ),
                                margin: const EdgeInsets.only(left: 20),
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
                                      label: 'إلى'
                                  ),
                                ),
                              ),




                            ],
                          ),
                        ):const SizedBox(height: 5,),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(start: 50),
                          child: Row(
                            children: [
                              Text('العلاج',style:TextStyle(
                                  fontSize: 16,
                                  color: fontColor3
                              ),
                              ),
                            ],
                          ),
                        ),
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
                                      label: 'أدخل العلاج'
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding:  EdgeInsetsDirectional.only(start: 50),
                          child: Row(
                            children: [
                              Text('تكلفة العلاج',style:TextStyle(
                                  fontSize: 16,
                                  color: fontColor3
                              ),
                              ),
                            ],
                          ),
                        ),

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
                                      label: 'أدخل التكلفة'
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
                              child: const Center(child: Text('إضافة بند معالجة جديد', style: TextStyle(
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
    void addNewTreatmentPlan(BuildContext context){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SimpleDialog(
                title: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 80),
                  child: Text('تفاصيل الخطة العلاجية',style:
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
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 400,

                      child:      Column(
                        children: [
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 30),
                                child: Text('العلاج',style:TextStyle(
                                  fontSize: 16,
                                  color: fontColor3
                                ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0),
                              width: 400, // Specify the width of the container
                              height: 50, // Specify the height of the container
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                                borderRadius: BorderRadius.circular(10), // Apply a circular border radius
                              ),
                              child: InkWell(
                                onTap: (){
                                  addTreatmentItem(context);

                                },
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.only(start: 20,top: 10.0),
                                  child: Text('+ إضافة بند علاجي',style:TextStyle(
                                      fontSize: 18,
                                      color: simpleDialogTitleColor,
                                  ),
                                  ),
                                ),
                              ),

                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                             shrinkWrap: true,
                             itemBuilder: (context,index)=>Container(height: 50,width: 50,color: Colors.red,),
                             separatorBuilder: (context,index)=>Padding(
                               padding: const EdgeInsetsDirectional.only(start:30 ),
                               child: Container(height: 1,color: Colors.grey,),
                             ),
                             itemCount: 0,
                                                 ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: (){
                              // treatmentPlanDetails(context);
                              addNewTreatmentPlan(context);

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
                                child: const Center(child: Text('إضافة خطة جديدة', style: TextStyle(
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
    
    Widget treatmentPlanItem(){
      return Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 4.0),
              width: 250, // Specify the width of the container
              height: 230, // Specify the height of the container
              decoration: BoxDecoration(
                border: Border.all(
                  color: coolBorderColor, // Set the border color
                  width: 2, // Set the border width
                ),
                borderRadius: BorderRadius.circular(10), // Apply a circular border radius
              ),
              child:  Column(
                children: [
                  const SizedBox(height: 25,),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text(' تاريخ الجلسة:',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),
                        Spacer(),
                        Text('1-4-2023',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),


                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text('التكلفة:',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),
                        Spacer(),
                        Text('1500000',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),


                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text('عدد الجلسات:',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),
                        Spacer(),
                        Text('5',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),


                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Text('الحسم:',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),
                        Spacer(),
                        Text('0%',style: TextStyle(
                          fontSize: 18,
                          color:fontColor2,
                        ),
                        ),


                      ],
                    ),
                  ),




                  InkWell(
                    onTap: (){
                      treatmentPlanDetails(context);

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container( // Add your Container here
                        height: 35, // Specify the height of the new container
                        width: 200, // Make it take the full width
                        //  color: Colors.blue, // Example color
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(child: Text('تفاصيل الخطة', style: TextStyle(
                            fontSize: 16,
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
          ),
          Positioned(
            top: 0.0, // Position the overlay container above the top border
            left:75,
            right: 75,
            child: Container(
              height: 40, // Height of the overlay container
              width: double.infinity,
              decoration: BoxDecoration(
                  color: coolGreen1,
                  borderRadius: BorderRadius.circular(30)
              ),

              child: const Center(child: Text('مكتملة',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white

              ),
              ),

              ),
              //color: Colors.red,
            ),
          )
        ],
      );
    }



    return BlocConsumer<DrAidCubit,DrAidStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Column(
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
                      return treatmentPlanItem();
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
                addNewTreatmentPlan(context);
                //addPayment(context);

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
                  child: const Center(child: Text('إضافة خطة جديدة', style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                  ),
                  ),
                ),
              ),
            ),

          ],
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
