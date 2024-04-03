// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CreatePoll extends StatefulWidget {
  const CreatePoll({super.key});

  @override
  State<CreatePoll> createState() => _CreatePollState();
}

class _CreatePollState extends State<CreatePoll> {

  TextEditingController question = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController duration = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Poll"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [

                    textfWidget(question, label: "Question"),
                    textfWidget(option1, label: "Option 1"),
                    textfWidget(option2, label: "Option 2"),
                    textfWidget(duration, label: "Duration"),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width-100,
                        decoration: BoxDecoration(
                        color: Colors.blue,
                         borderRadius: BorderRadius.circular(10)),
                         alignment: Alignment.center,
                         child: const Text("Done"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget textfWidget(TextEditingController controller, {String? label}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Input is required";
          }
          return null;
        },
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(),
          labelText: label!,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}