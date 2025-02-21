import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';

class CompleteInfoItem extends StatelessWidget {
  const CompleteInfoItem(
      {super.key,
      required this.label,
      this.inputType,
      this.onSaved,
      this.maxLines, this.validator});
  final String label;
  final TextInputType? inputType;
  final ValueSetter? onSaved;
  final FormFieldValidator? validator;

  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(label,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black)),
      ),
      const VerticalSpace(2),
      CustomTextField(
        inputType: inputType,
        maxLines: maxLines,
        onSaved: onSaved,
        validator: validator,
      )
    ]);
  }
}
