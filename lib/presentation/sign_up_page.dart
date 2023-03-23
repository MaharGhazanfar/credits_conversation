import 'package:badges/badges.dart';
import 'package:credit_and_conversation/custom_widgets/customTextField.dart';
import 'package:credit_and_conversation/presentation/password_change.dart';
import 'package:credit_and_conversation/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? selectedOption;
  DateTime selectedDate = DateTime.now();
  final FocusNode _focusNode = FocusNode();

  final List<String> options = ['Male', 'Female', 'Other'];

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      print(DateFormat("yyyy-MM-dd").format(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Badge(
                  badgeContent: Icon(
                    Icons.camera_alt,
                    size: mq!.width * 0.05,
                  ),
                  position: BadgePosition.bottomEnd(bottom: 5, end: 10),
                  showBadge: true,
                  stackFit: StackFit.passthrough,
                  onTap: () {},
                  child: CircleAvatar(
                    radius: mq!.width * 0.18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: goldenColor,
                      size: mq!.width * 0.18,
                    ),
                  ),
                ),
                const CustomTextField(
                  hintText: 'First Name',
                  prefixIcon: Icons.person,
                ),
                const CustomTextField(
                  hintText: 'Last Name',
                  prefixIcon: Icons.person,
                ),
                const CustomTextField(
                  hintText: 'Enter email address ',
                  prefixIcon: Icons.mail,
                ),
                const CustomTextField(
                  hintText: 'Create password',
                  prefixIcon: Icons.lock,
                ),
                const CustomTextField(
                  hintText: 'Confirm password',
                  prefixIcon: Icons.lock,
                ),
                CustomTextField(
                  hintText: '${selectedDate.toLocal()}'.split(' ')[0],
                  focusNode: _focusNode,
                  prefixIcon: Icons.calendar_month_sharp,
                  onTap: () async {
                    _focusNode.unfocus();

                    _showDatePicker(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 60),
                      prefixIcon: const Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Select your gender',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedOption,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    items:
                        options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntlPhoneField(
                    //controller: phoneController,
                    dropdownIconPosition: IconPosition.trailing,
                    flagsButtonPadding: const EdgeInsets.only(left: 5, top: 5),
                    decoration: InputDecoration(
                      prefixStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        //    fontWeight: FontWeight.bold
                      ),
                      errorStyle: const TextStyle(
                          color: Colors.red,
                          leadingDistribution: TextLeadingDistribution.even),
                      //contentPadding: const EdgeInsets.only(top: 17, bottom: 0),
                      hintText: 'Phone Number',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (phone) {
                      // print(phone.completeNumber);
                      // number = phone.completeNumber;
                    },
                    style: const TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    onCountryChanged: (country) {
                      print('Country changed to: ${country.name}');
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    dropdownTextStyle:
                        const TextStyle(color: Colors.black54, fontSize: 18),
                    pickerDialogStyle: PickerDialogStyle(
                        countryCodeStyle:
                            const TextStyle(color: Colors.black54)),
                  ),
                ),
                CustomGoldenButton(
                  buttonTitle: 'Create Account',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePassword(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
