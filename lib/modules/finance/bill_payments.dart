import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillPayments extends StatelessWidget {
  const BillPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 80.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 450,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                DrAidCubit.get(context).changeMedicineIndex(0);
                              },
                              child: DrAidCubit.get(context).medicineindex == 0
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'كامل الدفعات',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor4),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                linearGradiant1,
                                                linearGradiant2,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'كامل الدفعات',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor3),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                DrAidCubit.get(context).changeMedicineIndex(1);
                              },
                              child: DrAidCubit.get(context).medicineindex == 1
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'الفواتير غير المكتملة',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor4),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                linearGradiant1,
                                                linearGradiant2,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'الفواتير غير المكتملة',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor3),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                DrAidCubit.get(context).changeMedicineIndex(2);
                              },
                              child: DrAidCubit.get(context).medicineindex == 2
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'إجمالي المصاريف',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor4),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                linearGradiant1,
                                                linearGradiant2,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'إجمالي المصاريف',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor3),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                DrAidCubit.get(context).changeMedicineIndex(3);
                              },
                              child: DrAidCubit.get(context).medicineindex == 3
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'بيان حساب مزود',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor4),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                linearGradiant1,
                                                linearGradiant2,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'بيان حساب مزود',
                                          style: TextStyle(
                                              fontSize: 20, color: fontColor3),
                                        ),
                                        Container(
                                          width: 90,
                                          height: 3,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 200,
                            child: CustomSearchField(
                              icon: Icons.search,
                              hintText: 'بحث عن دفعة',
                              controller: TextEditingController(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DrAidCubit.get(context)
                            .paymentsAndBillAndExpensesAndProvider[
                        DrAidCubit.get(context).medicineindex],
                    // buildMedicineItem(context),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
