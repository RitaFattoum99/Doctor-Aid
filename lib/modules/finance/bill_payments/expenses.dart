import 'package:draid/layout/cubit/cubit.dart';
import 'package:draid/layout/cubit/states.dart';
import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrAidCubit, DrAidStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                MyDatePicker(title: 'من تاريخ', initialDate: DateTime.now()),
                const SizedBox(width: 20),
                const SizedBox(
                  height: 40,
                  child: VerticalDivider(
                    width: 10,
                    thickness: 1,
                    indent: 10,
                    endIndent: 1,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                MyDatePicker(title: 'إلى تاريخ', initialDate: DateTime.now()),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(coolGreen1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "تم",
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الإجمالي',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor2,
                              ),
                            ),
                            Text(
                              '800.000 ل.س',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: fontColor2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المدفوع',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor2,
                              ),
                            ),
                            Text(
                              '200.000 ل.س',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: fontColor2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الباقي',
                              style: TextStyle(
                                fontSize: 18,
                                color: fontColor2,
                              ),
                            ),
                            Text(
                              '600.000 ل.س',
                              style: TextStyle(
                                fontSize: 18,
                                color: blueText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
