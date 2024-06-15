import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class IncompleteBill extends StatelessWidget {
  const IncompleteBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
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
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 50.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 240,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'المعرف',
                        style: TextStyle(fontSize: 18, color: fontColor),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        'دفعة',
                        style: TextStyle(fontSize: 18, color: fontColor),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        'الفاتورة',
                        style: TextStyle(fontSize: 18, color: fontColor),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Text(
                        'التاريخ',
                        style: TextStyle(fontSize: 18, color: fontColor),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        'الخيارات',
                        style: TextStyle(fontSize: 18, color: fontColor),
                      ),
                      SizedBox(
                        width: 80,
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
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 80,
                              ),
                              const Text(
                                '1',
                                style:
                                    TextStyle(fontSize: 16, color: fontColor),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              const Text(
                                '200,000 ل.س',
                                style:
                                    TextStyle(fontSize: 16, color: fontColor),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              const Text(
                                '134',
                                style:
                                    TextStyle(fontSize: 16, color: fontColor),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              const Text(
                                '20-8-2024',
                                style:
                                    TextStyle(fontSize: 16, color: fontColor),
                              ),
                              const SizedBox(
                                width: 100,
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: borderColor,
                        );
                      },
                      itemCount: 30),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
