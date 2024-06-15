import 'package:flutter/material.dart';
import 'package:draid/shared/styles/colors.dart';

class ShowBillInformation extends StatelessWidget {
  const ShowBillInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 80.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 450,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 30),
              child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'المعرّف',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'النوع',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'المحتوى',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'الاجمالي',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    'التاريخ',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'المزود',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 57,
                  ),
                  Text(
                    'الدفعة',
                    style: TextStyle(fontSize: 18, color: fontColor),
                  ),
                  SizedBox(
                    width: 57,
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
                      padding: const EdgeInsetsDirectional.only(start: 30),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 45,
                          ),
                          const Text(
                            '1',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          const Text(
                            'مواد',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          const Text(
                            'جسور وحاصرات',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          const Text(
                            '300,000 ل.س',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            '23-4-2024',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Text(
                            'مركز سيكو',
                            style: TextStyle(fontSize: 16, color: fontColor),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const CircleAvatar(
                            backgroundColor: circulerAvatarColor,
                            radius: 15,
                            child: Icon(
                              Icons.add,
                              color: white,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 50,
                          // ),
                          const SizedBox(
                            width: 75,
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
