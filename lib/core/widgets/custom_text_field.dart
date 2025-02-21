import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.inputType, this.onSaved, this.onChanged, this.maxLines, this.validator});
  final TextInputType? inputType;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final FormFieldValidator? validator;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0XFFCCCCCC)))),
    );
  }
}
