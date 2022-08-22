import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomField extends StatelessWidget{
  TextInputType ?textInputType;
  String ?hint;
  TextEditingController ?controller;
  final Function validator;
  IconData ?icon;
  CustomField({
    this.textInputType,
    this.hint,
    this.controller,
    required this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 300,
      height: 60,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        validator:(x)=>validator(x),
        decoration: InputDecoration(
            suffix: Icon(icon,color: Colors.black,),
            labelText:hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
        ),
      ),
    );
    //   TextFormField(
    //   obscureText:obscureText,
    //   controller: controller,
    //   validator: (x) => validator(x),
    //   keyboardType: type,
    //   textInputAction: textInputAction,
    //   cursorColor: kPrimaryColor,
    //   // onSaved: (email) {},
    //   decoration: InputDecoration(
    //     hintText: hint,
    //     prefixIcon: Padding(
    //       padding: const EdgeInsets.all(defaultPadding),
    //       child: Icon(icon),
    //     ),
    //   ),
    // );
  }

}