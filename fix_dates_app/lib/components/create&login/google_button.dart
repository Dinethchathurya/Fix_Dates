// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fix_dates_app/components/create&login/logo.dart';

// ignore: must_be_immutable
class GoogleButton extends StatelessWidget {
  final Function()? onTap;

   GoogleButton({
    this.buttontext,
    super.key, required this.onTap});

     String? buttontext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
         padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.grey.shade400,
            )
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(imagePath: 'lib/images/google.png'),
               SizedBox(width: 20),
               Center(
          child: Text(
            buttontext?? "",
            // ignore: duplicate_ignore
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            ),
          ])

      ),
    );
  }
}