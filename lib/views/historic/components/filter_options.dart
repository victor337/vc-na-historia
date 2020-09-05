import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {

  final String title;
  final Function(bool value) setFilter;
  final bool value;

  const FilterOption({
    @required this.title,
    @required this.setFilter,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title
          ),
          Checkbox(
            value: value,
            onChanged: setFilter,
          ),
        ],
      ),
    );
  }
}