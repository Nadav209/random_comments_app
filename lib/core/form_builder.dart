import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterTextField extends StatelessWidget {
  RegisterTextField({
    Key? key,
    this.controller,
    this.labelName,
    this.returnErr,
    this.icon,
    this.hintText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? labelName, hintText;
  final Icon? icon;
  final String? returnErr;

  final RegExp exp_fullName = RegExp(r'^[a-z A-Z]');

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: "RegisterTextField",
      controller: controller,
      decoration: InputDecoration(
          labelText: labelName,
          labelStyle: TextStyle(color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          icon: icon),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(context, errorText: "Required field"),
        FormBuilderValidators.match(context, exp_fullName.pattern,
            errorText: returnErr),
      ]),
      //  onSaved: (String value) {},
      //validator: _validator,
    );
  }
}
