// ignore_for_file: unused_import

import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/layout/finance_layout/finance_layout.dart';
import 'package:draid/layout/patient_layout/patient_information_layout.dart';
import 'package:draid/modules/all_patients/all_patients.dart';
import 'package:draid/modules/alltreatments/show_treatments.dart';
import 'package:draid/modules/addclinic/add_clinic.dart';
import 'package:draid/modules/dashboard/dashboard_screen.dart';
import 'package:draid/modules/login/login_screen.dart';
import 'package:draid/modules/test.dart';
import 'package:draid/shared/bloc_observer.dart';
import 'package:draid/shared/network/local/cache_helper.dart';
import 'package:draid/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: change index for finance screens
//! اندكس واجهات المالية
//TODO: save token
//TODO: Naviation
//TODO: validation
//TODO: splash or welcome page
void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  widget = const DashboardScreen();
  // PatientScreen(
  //   clinicId: 18,
  //   token:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiZnVsbE5hbWUiOiJhYWFhYdij2K3ZhdivINi02YrYriDYp9mE2LTYqNin2KgiLCJyb2xlcyI6WyJhZG1pbiJdLCJpYXQiOjE3MTg4MTgzNDJ9.Xm9JqTT-dr0UW9K1VyRHtFe1k2V0mZCXgjO0krZQiqQ',
  // );

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DrAidCubit(),
          ),
        ],
        child: BlocConsumer<DrAidCubit, DrAidStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.deepPurple),
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: startWidget,
              ),
            );
          },
        ));
  }
}
