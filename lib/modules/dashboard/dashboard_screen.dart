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
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        onTap: (){
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
