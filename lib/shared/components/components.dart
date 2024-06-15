// ignore_for_file: deprecated_member_use

import 'package:draid/modules/dashboard/dashboard_screen.dart';
import 'package:draid/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginFormField extends StatelessWidget {
  final String hintText;
  final Color color;
  final TextEditingController controller;
  const LoginFormField(
      {super.key,
      required this.hintText,
      required this.color,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        fillColor: color,
        filled: true,
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.buttonColor,
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
            )),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Directionality(
                textDirection: TextDirection.rtl,
                child: DashboardScreen(),
              ),
            ),
          );
        },
        child: const Text(
          'تسجيل الدخول',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? validate;

  final void Function(String)? onSubmit;
  final bool isPassword;
  final IconData? suffix;
  final VoidCallback? sufficfunction;
  final VoidCallback? ontap;
  final bool isClickable;
  final Color? color;

  const DefaultFormField(
      {super.key,
      required this.prefix,
      required this.type,
      required this.controller,
      required this.validate,
      this.onChange,
      required this.label,
      this.onSubmit,
      this.isPassword = false,
      this.suffix,
      this.sufficfunction,
      this.ontap,
      this.isClickable = true,
      this.color,
      required Color fillColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onTap: ontap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: sufficfunction, icon: Icon(suffix))
            : null,
        fillColor: color,
      ),
    );
  }
}

class ClinicFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;

  final ValueChanged<String>? onChange;

  final String? Function(String?)? validate;

  final void Function(String)? onSubmit;
  final bool isPassword;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? sufficfunction;
  final VoidCallback? ontap;
  final bool isClickable;
  final bool isreadOnly;
  final String? imagePath;

  const ClinicFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    this.onChange,
    required this.label,
    this.onSubmit,
    this.isPassword = false,
    this.suffix,
    this.sufficfunction,
    this.ontap,
    this.isClickable = true,
    this.isreadOnly = false,
    this.prefix,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onTap: ontap,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: imagePath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  '$imagePath',
                  semanticsLabel: 'My SVG Image',
                  height: 20,
                  width: 20,
                  color: fontColor2,
                ),
              )
            : null,
        // prefix != null
        //     ? IconButton(onPressed: sufficfunction, icon: Icon(prefix))
        //     : null,

        hintText: label,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor)),
        suffixIcon: suffix != null
            ? IconButton(onPressed: sufficfunction, icon: Icon(suffix))
            : null,
      ),
    );
  }
}

class AddTreatmentFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;

  final ValueChanged<String>? onChange;

  final String? Function(String?)? validate;

  final void Function(String)? onSubmit;
  final bool isPassword;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? sufficfunction;
  final VoidCallback? ontap;
  final bool isClickable;
  final bool isreadOnly;
  final String? imagePath;

  const AddTreatmentFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    this.onChange,
    required this.label,
    this.onSubmit,
    this.isPassword = false,
    this.suffix,
    this.sufficfunction,
    this.ontap,
    this.isClickable = true,
    this.isreadOnly = false,
    this.prefix,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onTap: ontap,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: imagePath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  '$imagePath',
                  semanticsLabel: 'My SVG Image',
                  height: 20,
                  width: 20,
                  color: fontColor2,
                ),
              )
            : null,
        // prefix != null
        //     ? IconButton(onPressed: sufficfunction, icon: Icon(prefix))
        //     : null,

        hintText: label,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        suffixIcon: suffix != null
            ? IconButton(onPressed: sufficfunction, icon: Icon(suffix))
            : null,
      ),
    );
  }
}

class ClinicFormFieldDialog extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;

  final ValueChanged<String>? onChange;

  final String? Function(String?)? validate;

  final void Function(String)? onSubmit;
  final bool isPassword;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? sufficfunction;
  final VoidCallback? ontap;
  final bool isClickable;
  final bool isreadOnly;
  final String? imagePath;

  const ClinicFormFieldDialog({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    this.onChange,
    required this.label,
    this.onSubmit,
    this.isPassword = false,
    this.suffix,
    this.sufficfunction,
    this.ontap,
    this.isClickable = true,
    this.isreadOnly = false,
    this.prefix,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onTap: ontap,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: imagePath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  '$imagePath',
                  semanticsLabel: 'My SVG Image',
                  height: 20,
                  width: 20,
                  color: fontColor2,
                ),
              )
            : null,
        // prefix != null
        //     ? IconButton(onPressed: sufficfunction, icon: Icon(prefix))
        //     : null,

        hintText: label,
        helperStyle: const TextStyle(
          fontSize: 16,
          color: fontColor2,
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: textFieldBorderColor)),
        suffixIcon: suffix != null
            ? IconButton(onPressed: sufficfunction, icon: Icon(suffix))
            : null,
      ),
    );
  }
}

class AddAttachmentField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;

  final ValueChanged<String>? onChange;

  final String? Function(String?)? validate;

  final void Function(String)? onSubmit;
  final bool isPassword;
  final IconData? suffix;
  final IconData? prefix;
  final VoidCallback? sufficfunction;
  final VoidCallback? ontap;
  final bool isClickable;
  final bool isreadOnly;
  final String? imagePath;
  final String? suffixImagePath;

  const AddAttachmentField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    this.onChange,
    required this.label,
    this.onSubmit,
    this.isPassword = false,
    this.suffix,
    this.sufficfunction,
    this.ontap,
    this.isClickable = true,
    this.isreadOnly = false,
    this.prefix,
    this.imagePath,
    this.suffixImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onTap: ontap,
      validator: validate,
      decoration: InputDecoration(
        prefixIcon: imagePath != null
            ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  '$imagePath',
                  semanticsLabel: 'My SVG Image',
                  height: 20,
                  width: 20,
                  color: fontColor2,
                ),
              )
            : null,
        // prefix != null
        //     ? IconButton(onPressed: sufficfunction, icon: Icon(prefix))
        //     : null,

        hintText: label,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        suffixIcon: suffixImagePath != null
            ? InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  '$suffixImagePath',
                  semanticsLabel: 'My SVG Image',
                  height: 50,
                  width: 50,
                  // color: fontColor2,
                ),
              )
            : null,
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

class MyDatePicker extends StatefulWidget {
  final String title;
  final DateTime initialDate;

  const MyDatePicker(
      {super.key, required this.title, required this.initialDate});

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _MyDatePickerState createState() => _MyDatePickerState(initialDate);
}

class _MyDatePickerState extends State<MyDatePicker> {
  late DateTime _selectedDate;
  _MyDatePickerState(this._selectedDate);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(datePickerColor),
          ),
          onPressed: () => _selectDate(context),
          child: Row(
            children: [
              const Icon(
                Icons.date_range_outlined,
                color: blueText,
              ),
              const SizedBox(width: 20),
              Text(
                widget.title,
                style: const TextStyle(color: blueText),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Text('Selected Date: ${_selectedDate.toIso8601String()}'),
      ],
    );
  }
}

class CustomSearchField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const CustomSearchField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: blueText,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: blueText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: datePickerColor,
        contentPadding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
