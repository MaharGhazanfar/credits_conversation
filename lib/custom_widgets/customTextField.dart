// ignore_for_file: file_names

import 'package:credit_and_conversation/utils/contants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final String? hintText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const CustomTextField(
      {Key? key,
      this.focusNode,
      this.onChanged,
      this.validator,
      this.onTap,
      this.obscureText = false,
      this.hintText,
      this.prefixIcon,
      this.suffix,
      this.textInputType,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: textInputType,
        focusNode: focusNode,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 60),
            filled: true,
            fillColor: Colors.white,
            suffix: suffix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(prefixIcon),
            hintText: hintText),
      ),
    );
  }
}

class CustomGoldenButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final TextStyle? style;

  const CustomGoldenButton(
      {Key? key,
      required this.buttonTitle,
      required this.onPressed,
      this.width,
      this.style = const TextStyle(color: Colors.black87),
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          onPressed: onPressed,
          child: Text(buttonTitle, style: style)),
    );
  }
}

class CustomProfileField extends StatelessWidget {
  final String fieldTitle;
  final String fieldValue;
  final IconData icon;
  final double? width;
  final double? textWidth;
  const CustomProfileField(
      {Key? key,
      required this.fieldTitle,
      required this.fieldValue,
      this.textWidth,
      required this.icon,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            fieldTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: width,
              child: Row(
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: textWidth,
                      child: Text(
                        fieldValue,
                        maxLines: null,
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ImageTitleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  // ignore: use_key_in_widget_constructors
  const ImageTitleCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: goldenColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: Stack(
        children: <Widget>[
          // Image on the back
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Title on the image
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget? trailingIcon;
  final void Function()? onTap;
  const CustomListile(
      {Key? key,
      required this.title,
      this.onTap,
      this.leadingIcon = Icons.check,
      this.trailingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: goldenColor,
      ),
      onTap: onTap,
      trailing: trailingIcon,
      horizontalTitleGap: 0,
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.black54)),
    );
  }
}
