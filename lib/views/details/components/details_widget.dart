import 'package:flutter/material.dart';


class DetailsWidget extends StatelessWidget {
  
  final String title;
  final String value;

  const DetailsWidget({
    @required this.title,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18
            ),
          ),
        ],
      ),
    );
  }
}