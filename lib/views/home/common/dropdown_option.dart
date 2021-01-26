import 'package:flutter/material.dart';

class DropDownOption extends StatelessWidget {
  final String title;
  final List<String> options;
  final Function(String) onChanged;
  final String value;

  const DropDownOption({
    @required this.title,
    @required this.options,
    @required this.onChanged,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            dropdownColor: Colors.white,
            isDense: true,
            underline: Visibility(visible: false, child: Container()),
            items: options.map((String dropDownStringItem) {
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
