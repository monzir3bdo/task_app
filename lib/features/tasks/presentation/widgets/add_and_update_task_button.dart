import 'package:flutter/material.dart';

class AddAndUpdateTaskButton extends StatelessWidget {
  const AddAndUpdateTaskButton(
      {super.key, required this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
