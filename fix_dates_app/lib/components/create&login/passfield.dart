// ignore_for_file: unused_import
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {

  final controller;
  final String hintText;

   PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return  Padding(
                // ignore: prefer_const_constructors
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                 controller: widget.controller,
                  obscureText: hidden,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hidden = !hidden;
                          });
                        },
                        child: Icon( hidden 
                        ? Icons.visibility_off
                        : Icons.visibility,
                        color: Colors.grey.shade400,
                        ) ,
                      ) ,
                      // ignore: prefer_const_constructors
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        ),
                        hintText: widget.hintText,
                  ),
                ),
              );
  }

}