import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/app_router.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  State<ExitDialog> createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Close Application',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.sp,
        ),
      ),
      content: Text(
        'Are you sure?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
          onPressed: (){
            AppRouter.popWidget();
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp
            ),
          )
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          onPressed: (){
            exit(0);
          },
          child: Text(
            'Exit',
            style: TextStyle(
              fontSize: 18.sp
            ),
          )
        )
      ],
    );
  }
}
