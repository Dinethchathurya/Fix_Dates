// import 'dart:async'; // Import the dart:async library for StreamSubscription

// import 'package:fix_dates_app/database/getEvents.dart';
// import 'package:flutter/material.dart';

// class GetMyEvents extends StatefulWidget {
//   late String groupName;

//   GetMyEvents({Key? key, required this.groupName}) : super(key: key);

//   @override
//   _GetMyEventsState createState() => _GetMyEventsState();
// }

// class _GetMyEventsState extends State<GetMyEvents> {
//   GetEvents getEvents = GetEvents();
//   late StreamSubscription<List<Map<String, dynamic>>> eventsSubscription;
//   late Stream<List<Map<String, dynamic>>> bbStream;
//   @override
//   void initState() {
//     super.initState();
//     // Subscribe to the stream and listen for events

//     // eventsSubscription = getEvents.getEvents(widget.groupName).listen((events) {
//     //   // Handle events here, you can set the events to state or perform any other action
//     //   setState(() {
//     //     // Set events to state if needed
//     //   });
//     // },
//     // );
//     var groupName = widget.groupName;
//     GetEvents getEvents = GetEvents();
//     bbStream = getEvents.getEvents(groupName);
//     print('data : $bbStream');
//   }

//   @override
//   void dispose() {
//     // Cancel the subscription when the widget is disposed to avoid memory leaks
//     eventsSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Events"),
//       ),
//       body: Center(
//         child: StreamBuilder<List<Map<String, dynamic>>>(
//           stream: bbStream, // Pass the stream to stream parameter
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               var data = snapshot.data;
//               return ListView.builder(
//                 itemCount: data!.length,
//                 itemBuilder: (context, index) {
//                   var documentId = data[index][
//                       'id']; // Assuming 'id' is the key for document ID in your map
//                   return ListTile(
//                     title: Text('Document ID: $documentId'),
//                     // Other widget properties based on your data
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );

//     //   Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('Events'),
//     //   ),
//     //   body: SafeArea(
//     //     child: Container(
//     //       margin: EdgeInsets.all(20.0),
//     //       child: Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         children: [
//     //           Padding(
//     //             padding: EdgeInsets.symmetric(vertical: 10.0),
//     //             child: Text(
//     //               'Events for ${widget.groupName}',
//     //               style: TextStyle(
//     //                 fontSize: 25.0,
//     //               ),
//     //             ),
//     //           ),
//     //           Expanded(
//     //             child: StreamBuilder<List<Map<String, dynamic>>>(
//     //               stream: getEvents.getEvents(widget.groupName),
//     //               builder: (context, snapshot) {
//     //                 if (snapshot.connectionState == ConnectionState.waiting) {
//     //                   return Center(child: CircularProgressIndicator());
//     //                 } else if (snapshot.hasError) {
//     //                   return Center(child: Text('Error: ${snapshot.error}'));
//     //                 } else {
//     //                   List<Map<String, dynamic>>? events = snapshot.data;
//     //                   if (events == null || events.isEmpty) {
//     //                     return Center(
//     //                         child: Text(
//     //                             'No events found for ${widget.groupName}.'));
//     //                   } else {
//     //                     return ListView.builder(
//     //                       itemCount: events.length,
//     //                       itemBuilder: (context, index) {
//     //                         return ListTile(
//     //                           title: Text(events[index]['eventName']),
//     //                           subtitle: Text(events[index]['eventDescription']),
//     //                           // Add more event details if needed
//     //                         );
//     //                       },
//     //                     );
//     //                   }
//     //                 }
//     //               },
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     //   floatingActionButton: FloatingActionButton(
//     //     onPressed: () {
//     //       Navigator.pushNamed(context, '/CreateAnEvent');
//     //     },
//     //     shape: CircleBorder(),
//     //     backgroundColor: Colors.black,
//     //     child: Icon(
//     //       Icons.add,
//     //       size: 40.0,
//     //       color: Colors.white,
//     //     ),
//     //   ),
//     //   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     // );
//   }
// }

// //Text(data[index]['title']

// // ListView.builder(
// // itemCount: data!.length,
// // itemBuilder: (context, index) {
// // return ListTile(
// // title: Text(data[index]),
// // // Other widget properties based on your data
// // );
// // },
// // );

// // data[index]['id'];

import 'dart:async';

import 'package:fix_dates_app/Screens/BasicScreens/CreateAnEvent.dart';
import 'package:fix_dates_app/database/getEvents.dart';
import 'package:flutter/material.dart';

import '../../database/vote.dart';

class GetMyEvents extends StatefulWidget {
  final String groupName;

  const GetMyEvents({Key? key, required this.groupName}) : super(key: key);

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

  bool _hasVoted = false;
  int _selectedOptionIndex = -1;
  List<int> _votes = [0, 0]; // Track votes for each option
  //final List<String> _options = ["Bee honey", "Nikan Honey"];

  void _vote(int optionIndex) {
    if (!_hasVoted) {
      setState(() {
        _hasVoted = true;
        _selectedOptionIndex = optionIndex;
        _votes[optionIndex]++;
      });
    }
  }

  int _totalVotes() {
    return _votes.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Events for ${widget.groupName}',
                  style: const TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Expanded(
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
                          var documentId = data[index]['id'];
                          var title = data[index]['title'];
                          var description = data[index]['description'];
                          var createdUserId = data[index]['created_user_id'];
                          List options = data[index]['options'];

                          // Assuming 'id' is the key for document ID in your map
                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                ...List.generate(1, (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          leading: CircleAvatar(),
                                          title: Text('$title'),
                                          trailing: _hasVoted
                                              ? null
                                              : IconButton(
                                                  onPressed: () {},
                                                  icon:
                                                      const Icon(Icons.delete),
                                                ),
                                        ),
                                        Text('$description'),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        ...List.generate(options.length,
                                            (optionIndex) {
                                          return InkWell(
                                            onTap: () {
                                              _vote(optionIndex);
                                              print(
                                                  'option index $optionIndex');
                                              Vote vote = Vote();
                                              vote.updateUserVotes(
                                                  widget.groupName,
                                                  documentId,
                                                  options[optionIndex]);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      children: [
                                                        LinearProgressIndicator(
                                                          minHeight: 30,
                                                          value: _hasVoted
                                                              ? _votes[
                                                                      optionIndex] /
                                                                  100
                                                              : 0,
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          height: 30,
                                                          child: Text(options[
                                                              optionIndex]),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    _hasVoted
                                                        ? '${_votes[optionIndex]}%'
                                                        : 'Tap to Vote',
                                                    style: _hasVoted
                                                        ? TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold)
                                                        : null,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                        _hasVoted
                                            ? Text(
                                                "Total Votes: ${_totalVotes()}")
                                            : const SizedBox()
                                      ],
                                    ),
                                  );
                                })
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAnEvent(
                groupName: widget.groupName,
              ),
            ),
          );
        },
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
