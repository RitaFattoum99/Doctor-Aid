import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DebtsPatient extends StatelessWidget {
  const DebtsPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 50.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 300,
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
                  Text(
                    'المريض',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'دفعة',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    'الخطة العلاجية',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'بيان حساب',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'الدفعات',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 90,
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
            const Divider(
              color: dividerColor,
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
                          // const SizedBox(
                          //   width: 80,
                          // ),
                          const Text(
                            'محمد محمد',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          const Text(
                            '200,000 ل.س',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          const Text(
                            '1',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          Container(
                            width: 130,
                            height: 35,
                            decoration: BoxDecoration(
                              color: blueText,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                                onTap: () {},
                                child: const Center(
                                  child: Text(
                                    '  بيان حساب المريض  ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            width: 65,
                          ),
                          Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: coolGreen1,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: const Center(
                                child: Text(
                                  '  إضافة دفعة  ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
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
    );
  }
}
