// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Checkboxx extends StatefulWidget {
  const Checkboxx({super.key});

  @override
  State<Checkboxx> createState() => _CheckboxxState();
}

class _CheckboxxState extends State<Checkboxx> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
         Color getColor(Set<MaterialState> states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.selected,
        MaterialState.hovered
      };
      return states.any(interactiveStates.contains) ? Colors.blue : Colors.grey.shade300;
         }

    return Center(
      child: Checkbox(

                shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    ),
    side: MaterialStateBorderSide.resolveWith(
      (states) => BorderSide( color: Colors.transparent),
  ),


        value: isChecked,
        activeColor: Colors.blue,

        fillColor: MaterialStateProperty.resolveWith(getColor),

        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
        ),
        );
}
}