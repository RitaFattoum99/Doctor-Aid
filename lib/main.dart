import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
// import 'package:draid/layout/finance_layout/finance_layout.dart';
// import 'package:draid/layout/patient_layout/patient_information_layout.dart';
// import 'package:draid/modules/finance/bill_information.dart';
// import 'package:draid/modules/alltreatments/show_treatments.dart';
// import 'package:draid/modules/addclinic/add_clinic.dart';
// import 'package:draid/modules/alltreatments/show_treatments.dart';
import 'package:draid/modules/dashboard/dashboard_screen.dart';
// import 'package:draid/modules/login/login_screen.dart';
import 'package:draid/shared/bloc_observer.dart';
import 'package:draid/shared/network/local/cache_helper.dart';
import 'package:draid/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  widget = const DashboardScreen();

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
