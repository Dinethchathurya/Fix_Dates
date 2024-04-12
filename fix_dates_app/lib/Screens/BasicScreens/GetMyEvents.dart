import 'dart:async'; // Import the dart:async library for StreamSubscription

import 'package:fix_dates_app/database/getEvents.dart';
import 'package:flutter/material.dart';

class GetMyEvents extends StatefulWidget {
  late String groupName;

  GetMyEvents({Key? key, required this.groupName}) : super(key: key);

  @override
  _GetMyEventsState createState() => _GetMyEventsState();
}

class _GetMyEventsState extends State<GetMyEvents> {
  GetEvents getEvents = GetEvents();
  late StreamSubscription<List<Map<String, dynamic>>> eventsSubscription;
  late Stream<List<Map<String, dynamic>>> bbStream;
  @override
  void initState() {
    super.initState();
    // Subscribe to the stream and listen for events

    // eventsSubscription = getEvents.getEvents(widget.groupName).listen((events) {
    //   // Handle events here, you can set the events to state or perform any other action
    //   setState(() {
    //     // Set events to state if needed
    //   });
    // },
    // );
    var groupName = widget.groupName;
    GetEvents getEvents = GetEvents();
    bbStream = getEvents.getEvents(groupName);
    print('data : $bbStream');
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed to avoid memory leaks
    eventsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: bbStream, // Pass the stream to stream parameter
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  var documentId = data[index][
                      'id']; // Assuming 'id' is the key for document ID in your map
                  return ListTile(
                    title: Text('Document ID: $documentId'),
                    // Other widget properties based on your data
                  );
                },
              );
            }
          },
        ),
      ),
    );

    //   Scaffold(
    //   appBar: AppBar(
    //     title: Text('Events'),
    //   ),
    //   body: SafeArea(
    //     child: Container(
    //       margin: EdgeInsets.all(20.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.symmetric(vertical: 10.0),
    //             child: Text(
    //               'Events for ${widget.groupName}',
    //               style: TextStyle(
    //                 fontSize: 25.0,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: StreamBuilder<List<Map<String, dynamic>>>(
    //               stream: getEvents.getEvents(widget.groupName),
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return Center(child: CircularProgressIndicator());
    //                 } else if (snapshot.hasError) {
    //                   return Center(child: Text('Error: ${snapshot.error}'));
    //                 } else {
    //                   List<Map<String, dynamic>>? events = snapshot.data;
    //                   if (events == null || events.isEmpty) {
    //                     return Center(
    //                         child: Text(
    //                             'No events found for ${widget.groupName}.'));
    //                   } else {
    //                     return ListView.builder(
    //                       itemCount: events.length,
    //                       itemBuilder: (context, index) {
    //                         return ListTile(
    //                           title: Text(events[index]['eventName']),
    //                           subtitle: Text(events[index]['eventDescription']),
    //                           // Add more event details if needed
    //                         );
    //                       },
    //                     );
    //                   }
    //                 }
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.pushNamed(context, '/CreateAnEvent');
    //     },
    //     shape: CircleBorder(),
    //     backgroundColor: Colors.black,
    //     child: Icon(
    //       Icons.add,
    //       size: 40.0,
    //       color: Colors.white,
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    // );
  }
}

//Text(data[index]['title']

// ListView.builder(
// itemCount: data!.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(data[index]),
// // Other widget properties based on your data
// );
// },
// );

// data[index]['id'];
