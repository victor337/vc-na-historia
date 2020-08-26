import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {

  final String title;
  final Color color;

  const InfoWidget({
    @required this.title,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 20,
            width: 20,
            color: color,
          ),
          const SizedBox(height: 5,),
          Text(title)
        ],
      ),
    );
  }
}