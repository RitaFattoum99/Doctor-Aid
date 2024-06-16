import 'package:draid/modules/addclinic/add_clinic.dart';
import 'package:draid/layout/finance_layout/finance_layout.dart';
import 'package:flutter/material.dart';
import 'package:draid/modules/alltreatments/show_treatments.dart';
import 'package:draid/modules/dashboard/item_container.dart';
import 'package:draid/modules/sidebar/side_bar_screen.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: CustomAppBar(),
      body: Row(
        children: [
          const SideBarScreen(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Item(
                        num: 200,
                        text: 'سجلات المرضى',
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        child: const Item(
                          num: 4,
                          text: 'العيادات',
                        ),
                        onTap: () {
                          navigateTo(
                            context,
                            const Directionality(
                                textDirection: TextDirection.rtl,
                                child: AddClinicScreen()),
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      const Item(
                        num: 1140,
                        text: 'الفواتير',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: const Item(
                          num: 4,
                          text: 'العلاجات',
                        ),
                        onTap: () {
                          navigateTo(
                            context,
                            const Directionality(
                                textDirection: TextDirection.rtl,
                                child: ShowAllTreatments()),
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      const Item(
                        num: 50,
                        text: 'المواعيد',
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        child: const Item(
                          num: 18,
                          text: 'المالية',
                        ),
                        onTap: () {
                          navigateTo(
                            context,
                            const Directionality(
                                textDirection: TextDirection.rtl,
                                child: FinanceLayout()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
