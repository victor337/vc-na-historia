import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomFormField extends StatelessWidget {

  final String initialValue;
  final String hintText;
  final String labelText;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter> textInputFormatter;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final double height;
  final int maxLenght;

  const CustomFormField({
    @required this.initialValue,
    @required this.hintText,
    @required this.labelText,
    @required this.focusNode,
    @required this.textInputAction,
    @required this.keyboardType,
    @required this.textInputFormatter,
    @required this.onChanged,
    @required this.onSubmit,
    this.height,
    this.maxLenght
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        maxLength: maxLenght,
        initialValue: initialValue,
        focusNode: focusNode,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          counterText: '',
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