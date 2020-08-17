import 'package:flutter/material.dart';


class DetailsWidget extends StatelessWidget {
  
  final String title;
  final String value;
  final String tyme;

  const DetailsWidget({
    @required this.title,
    @required this.value,
    this.tyme
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              ),
              Visibility(
                visible: title == 'Data',
                child: Text(tyme??''),
              )
            ],
          )
        ],
      ),
    );
  }
}