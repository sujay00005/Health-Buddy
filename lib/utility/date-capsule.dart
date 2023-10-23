import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateCapsule extends StatelessWidget {
  final String day;
  final String date;
  final String month;
  final bool isActive;
  const DateCapsule({
    required this.day,
    required this.date,
    required this.month,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? CupertinoColors.activeBlue : Colors.white,
            border: Border.all(width: 1.0,color: Colors.grey),
            borderRadius: const BorderRadius.all(
                Radius.circular(50.0) //                 <--- border radius here
            ),
          ),
          child: Column(
            children: [
              Text(
                '${day}',
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontSize: 15,
                ),
              ),
              Text(
                '${date} ${month}',
                style: TextStyle(
                    color: isActive? Colors.white : Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}