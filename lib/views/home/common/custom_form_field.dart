import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomFormField extends StatelessWidget {

  final String hintText;
  final String labelText;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textInputFormatter;
  final Function(String) onChanged;
  final Function(String) onSubmit;

  const CustomFormField({
    @required this.hintText,
    @required this.labelText,
    @required this.focusNode,
    @required this.textInputAction,
    @required this.keyboardType,
    @required this.textInputFormatter,
    @required this.onChanged,
    @required this.onSubmit,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2
            )
          ),
          hintText: hintText,
          labelText: labelText,
        ),
        inputFormatters: textInputFormatter,
      ),
    );
  }
}