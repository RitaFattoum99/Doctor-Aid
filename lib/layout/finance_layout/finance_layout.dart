import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/modules/finance/bill.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
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
        return const Scaffold(
          backgroundColor: coolWhite2,
          appBar: CustomAppBar(),
          body: Row(
            children: [SideBarScreen(), Bill()],
          ),
        );
      },
    );
  }
}
