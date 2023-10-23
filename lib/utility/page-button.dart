import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageButton extends StatefulWidget {
  final String buttonTitle;
  final void Function() callback;
  const PageButton({
    super.key,
    required this.buttonTitle,
    required this.callback,
  });

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.only(top: 15, left: 50, right: 50, bottom: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
      ),
      child: InkWell(
        onTap: widget.callback,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: CupertinoColors.activeBlue,
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: const BorderRadius.all(
                Radius.circular(50.0) //                 <--- border radius here
                ),
          ),
          child: Text(
            widget.buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
