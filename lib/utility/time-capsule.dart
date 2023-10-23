import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeCapsule extends StatelessWidget {
  final String time;
  final bool isAM;
  final bool isActive;
  const TimeCapsule({
    required this.time,
    required this.isAM,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isActive ? CupertinoColors.activeBlue : Colors.white,
            border: Border.all(width: 1.0,color: Colors.grey),
            borderRadius: const BorderRadius.all(
                Radius.circular(50.0) //                 <--- border radius here
            ),
          ),
          child: Center(
            child:Text(
              '${time} ${isAM? 'AM' :'PM'}',
              style: TextStyle(
                  color: isActive? Colors.white : Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}