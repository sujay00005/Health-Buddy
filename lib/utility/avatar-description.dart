import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvatarDescription extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  const AvatarDescription({
    required this.title,
    required this.amount,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xffdbeaff),
              child: Icon(icon,color: CupertinoColors.activeBlue, size: 30),
            ),
            Text(
              amount,
              style: const TextStyle(
                  color: CupertinoColors.activeBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        )
    );
  }
}
