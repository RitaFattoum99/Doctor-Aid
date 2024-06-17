import 'package:draid/shared/components/components.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   'images/dental_logo1.png',
                  //   width: 200,
                  //   height: 200,
                  // ),

                  SvgPicture.asset(
                    'images/logo.svg',
                    semanticsLabel: 'My SVG Image',
                    height: 120,
                    width: 120,
                  ),
                  Text(
                    'Doctor Aid',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.buttonColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: ColorManager.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مرحبا بك،',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'سجل دخولك للعيادة',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    LoginFormField(
                      controller: emailController,
                      hintText: 'الحساب الإلكتروني',
                      color: Colors.white,
                    ),
                    const SizedBox(height: 25),
                    LoginFormField(
                      controller: passwordController,
                      hintText: 'كلمة المرور',
                      color: Colors.white,
                    ),
                    const SizedBox(height: 100),
                    const LoginButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
