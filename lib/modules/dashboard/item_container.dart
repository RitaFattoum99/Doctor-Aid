import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String text;
  final int num;
  const Item({super.key, required this.text, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.borderGreyColor, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), 
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 160,
        width: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorManager.babyGreyColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/token.png',
                    scale: 1,
                  ),
                  Text(
                    "$num",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: ColorManager.greenColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
