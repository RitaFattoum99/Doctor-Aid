import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/finance/bill.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/styles/colors.dart';
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
          body: const Row(
            children: [SideBarScreen(), Bill()],
          ),
        );
      },
    );
  }
}
