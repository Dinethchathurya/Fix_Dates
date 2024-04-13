import 'package:flutter/material.dart';
import 'package:fix_dates_app/database/CreateEvent.dart';

class CreateAnEvent extends StatefulWidget {
  final String groupName;
  final String createdUserid;

  const CreateAnEvent({Key? key, required this.groupName, required this.createdUserid}) : super(key: key);

  @override
  State<CreateAnEvent> createState() => _CreateAnEventState();
}

class _CreateAnEventState extends State<CreateAnEvent> {
  CreateEvent createEvent = CreateEvent();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  List<TextEditingController> optionControllers = [];

  @override
  void initState() {
    super.initState();
    optionControllers.add(TextEditingController());
    optionControllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Event"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    textfWidget(titleController, label: "Title"),
                    textfWidget(descriptionController, label: "Description"),
                    for (int i = 0; i < optionControllers.length; i++)
                      textfWidget(optionControllers[i], label: "Option ${i + 1}"),
                    // textfWidget(durationController, label: "Duration"),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          optionControllers.add(TextEditingController());
                        });
                      },
                      child: const Text("Add Option"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        createevent();
                      },
                      child: const Text("Create Event"),
                    ),
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
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    durationController.dispose();
    for (var controller in optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void createevent() {
    String title = titleController.text;
    String description = descriptionController.text;
    String groupName = widget.groupName;
    String createdUserid = widget.createdUserid;
    DateTime createdDatetime = DateTime.now();
    List<String> options = optionControllers.map((controller) => controller.text).toList();

    if (title.isNotEmpty && description.isNotEmpty) {
      createEvent.createEvent(groupName, title, description, createdUserid, createdDatetime, options);
      // Clear input fields after creating the event
      titleController.clear();
      descriptionController.clear();
      durationController.clear();
      optionControllers.forEach((controller) => controller.clear());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter Title and Description.'),
        ),
      );
    }
  }
}
