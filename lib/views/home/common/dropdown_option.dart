import 'package:flutter/material.dart';


class DropDownOption extends StatelessWidget {

  final List<String> options;
  final Function(String) onChanged;
  final String value;
  
  const DropDownOption({
    @required this.options,
    @required this.onChanged,
    @required this.value,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            underline: Visibility(visible: false, child: Container()),
            items: options.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: onChanged,
            value: value,
          ),
        ),
      ],
    );
  }
}