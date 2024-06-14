// ignore_for_file: deprecated_member_use
import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/patient/middle_bar.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              height: 700,
              color: coolWhite2,
              child: 
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 20, end: 130),
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
                            'المالية',
                            style: TextStyle(fontSize: 28, color: blueText),
                          ),
                          const Spacer(),
                          Container(
                            width: 250,
                            height: 50,
                            decoration: BoxDecoration(
                              color: coolGreen1,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 30),
                                child: Row(children: [
                                  SvgPicture.asset(
                                    'images/report.svg',
                                    // '$imagePath',
                                    //   semanticsLabel: 'My SVG Image',
                                    height: 30,
                                    width: 30,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    'تقرير صافي الأرباح',
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
                    const MiddleBar(
                      texts: ['الفواتير ', 'حساب المرضى ', 'دفعات الفواتير '],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DrAidCubit.get(context).bottomFinancescreens[
                        DrAidCubit.get(context).currentindex],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
