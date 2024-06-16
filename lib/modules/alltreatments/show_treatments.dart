import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAllTreatments extends StatefulWidget {
  const ShowAllTreatments({super.key});

  @override
  State<ShowAllTreatments> createState() => _ShowAllTreatmentsState();
}

class _ShowAllTreatmentsState extends State<ShowAllTreatments> {
  int index = 0;

  int selectedIndex1 = 0;

  bool isExpanded = true;

  var patientName = TextEditingController();
  var patientAge = TextEditingController();
  var patientAddress = TextEditingController();
  var patientPhoneNumber = TextEditingController();
  Widget buildContainer(context, int index) {
    if (index == 0) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex1 = index;
          });
        },
        child: Container(
          width: 246,
          height: 50,
          decoration: BoxDecoration(
            color: selectedIndex1 == index ? buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: selectedIndex1 == index
                        ? Colors.white
                        : numberBackGroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 20, color: fontColor2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'المعلومات الأساسية',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedIndex1 == index ? Colors.white : fontColor2),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (index == 1) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex1 = index;
          });
        },
        child: Container(
          width: 246,
          height: 50,
          decoration: BoxDecoration(
            color: selectedIndex1 == index ? buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: selectedIndex1 == index
                        ? Colors.white
                        : numberBackGroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 20, color: fontColor2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'الأدوية و الأمراض',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedIndex1 == index ? Colors.white : fontColor2),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (index == 2) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex1 = index;
          });
        },
        child: Container(
          width: 246,
          height: 50,
          decoration: BoxDecoration(
            color: selectedIndex1 == index ? buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: selectedIndex1 == index
                        ? Colors.white
                        : numberBackGroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 20, color: fontColor2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'المعالجات',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedIndex1 == index ? Colors.white : fontColor2),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (index == 3) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex1 = index;
          });
        },
        child: Container(
          width: 246,
          height: 50,
          decoration: BoxDecoration(
            color: selectedIndex1 == index ? buttonColor : Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: selectedIndex1 == index
                        ? Colors.white
                        : numberBackGroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 20, color: fontColor2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'المرفقات',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          selectedIndex1 == index ? Colors.white : fontColor2),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 10,
      );
    }
  }

  Widget buildShowBasicPatientInformation(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }

  Widget medicinesanddiseases(BuildContext context) {
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
                    'الأدوية التي يأخذها المريض',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget middleBar(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        buildContainer(context, index),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 5,
                        ),
                    itemCount: 4),
              ),

              //List.generate(4, (index1) => buildContainer(index1)),
            ],
          ),
        )
      ],
    );
  }

  Widget buildShowPatientInformation(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 700,
          color: coolWhite2,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'عرض معلومات مريض',
                      style: TextStyle(fontSize: 28, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                middleBar(context),
                const SizedBox(
                  height: 20,
                ),
                buildShowBasicPatientInformation(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController details = TextEditingController();

  void addNewTreatment(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SimpleDialog(
              title: const Padding(
                padding: EdgeInsetsDirectional.only(start: 150),
                child: Text(
                  'إضافة علاج جديد',
                  style: TextStyle(
                    fontSize: 18,
                    color: simpleDialogTitleColor,
                  ),
                ),
              ),
              children: <Widget>[
                //if(apiResponse.data.isEmpty)
                //Center(child: Text('No requests right now'),),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 600,

                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Text(
                              'اسم العلاج',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor,
                              ),
                            ),
                          ],
                        ),
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
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                              ),
                              margin:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 15),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Text(
                              'الصنف',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor,
                              ),
                            ),
                          ],
                        ),
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
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                              ),
                              margin:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 15),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Text(
                              'الكلفة الافتراضية',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor,
                              ),
                            ),
                          ],
                        ),
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
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                              ),
                              margin:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 15),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Text(
                              'الملاحظات',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor,
                              ),
                            ),
                          ],
                        ),
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
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                              ),
                              margin:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 15),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.only(start: 20),
                        child: Row(
                          children: [
                            Text(
                              'اختيار لون',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor,
                              ),
                            ),
                          ],
                        ),
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
                                  color: borderColor, // Set the border color
                                  width: 1, // Set the border width
                                ),
                              ),
                              margin:
                                  const EdgeInsetsDirectional.only(start: 20),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 15),
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
                        onTap: () {
                          // treatmentPlanDetails(context);
                          // addNewTreatmentPlan(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            // Add your Container here
                            height:
                                45, // Specify the height of the new container
                            width: 200, // Make it take the full width
                            //  color: Colors.blue, // Example color
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'إضافة علاج جديد',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: coolWhite2,
          appBar: AppBar(
            backgroundColor: white,
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
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  'العلاجات',
                                  style:
                                      TextStyle(fontSize: 28, color: blueText),
                                ),
                                const Spacer(),
                                Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: blueText,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      // navigateTo(context,const ToothChart());
                                      addNewTreatment(context);
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsetsDirectional.only(start: 30),
                                      child: Row(children: [
                                        Icon(
                                          Icons.add,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        // SvgPicture.asset(
                                        //   'images/tooth_icon.svg',
                                        //   // '$imagePath',
                                        //   //   semanticsLabel: 'My SVG Image',
                                        //   height: 30,
                                        //   width: 30,
                                        //   color: Colors.white,
                                        // ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'إضافة علاج جديد',
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
                          //    const MiddleBar(),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 175.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              height: 450,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 30),
                                    child: Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          'اسم العلاج',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          'الاختصاص',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          'الكلفة الافتراضية',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                        SizedBox(
                                          width: 120,
                                        ),
                                        Text(
                                          'ملاحظات',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                        SizedBox(
                                          width: 123,
                                        ),
                                        Text(
                                          'لون العلاج',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                        SizedBox(
                                          width: 57,
                                        ),
                                        Text(
                                          'الخيارات',
                                          style: TextStyle(
                                              fontSize: 18, color: fontColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 900,
                                        height: 1,
                                        color: dividerColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: 30),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text(
                                                  'حشوة سن بقناتين',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(
                                                  width: 58,
                                                ),
                                                const Text(
                                                  'اللبية',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(
                                                  width: 145,
                                                ),
                                                const Text(
                                                  '1500000',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(
                                                  width: 55,
                                                ),
                                                const Text(
                                                  'التكلفة تشمل التاج و الحشوة الدائمة',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: fontColor),
                                                ),
                                                const SizedBox(
                                                  width: 50,
                                                ),

                                                const CircleAvatar(
                                                  backgroundColor:
                                                      circulerAvatarColor,
                                                  radius: 15,
                                                ),

                                                // Text('لون العلاج',
                                                //   style: TextStyle(
                                                //       fontSize: 16,
                                                //       color:    fontColor
                                                //
                                                //   ),
                                                //
                                                // ),
                                                const SizedBox(
                                                  width: 75,
                                                ),

                                                Container(
                                                  width: 70,
                                                  height: 40,
                                                  color: Colors.white,
                                                  child: const Center(
                                                    child: Row(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                            'images/edit1.png',
                                                          ),
                                                          width: 25,
                                                          height: 25,
                                                        ),

                                                        // SvgPicture.asset(
                                                        //   'images/edit.svg',
                                                        //   semanticsLabel: 'My SVG Image',
                                                        //   height: 30,
                                                        //   width: 30,
                                                        //   // color: fontColor2,
                                                        // ),
                                                        // Icon(Icons.edit,color: fontColor,size: 30,),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Image(
                                                          image: AssetImage(
                                                            'images/delete.png',
                                                          ),
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                        // Icon(Icons.delete_outlined,color: fontColor,size: 30,)
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                // Text('الخيارات',
                                                //   style: TextStyle(
                                                //       fontSize: 16,
                                                //       color:    fontColor
                                                //
                                                //   ),
                                                //
                                                // ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            height: 10,
                                          );
                                        },
                                        itemCount: 30),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // DrAidCubit.get(context).bottomscreens[DrAidCubit.get(context).currentindex],
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // PatientInformation()
            ],
          ),
        );
      },
    );
  }
}
