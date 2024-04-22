import 'dart:async';

import 'package:fix_dates_app/Screens/BasicScreens/CreateAnEvent.dart';
import 'package:fix_dates_app/database/getEvents.dart';
import 'package:flutter/material.dart';

import '../../database/vote.dart';

class Event {
  final String id;
  final String title;
  final String description;
  final List<String> options;
  bool hasVoted;
  int selectedOptionIndex;
  List<int> votes;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.options,
    this.hasVoted = false,
    this.selectedOptionIndex = -1,
  }) : votes = List<int>.generate(options.length, (index) => 0);

  int totalVotes() {
    return votes.reduce((value, element) => value + element);
  }
}

class GetMyEvents extends StatefulWidget {
  final String groupName;

  const GetMyEvents({Key? key, required this.groupName}) : super(key: key);

  @override
  _GetMyEventsState createState() => _GetMyEventsState();
}

class _GetMyEventsState extends State<GetMyEvents> {
  GetEvents getEvents = GetEvents();
  late StreamSubscription<List<Map<String, dynamic>>> eventsSubscription;
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
    var groupName = widget.groupName;
    eventsSubscription = getEvents.getEvents(groupName).listen((data) {
      setState(() {
        events = data
            .map((eventData) => Event(
                  id: eventData['id'],
                  title: eventData['title'],
                  description: eventData['description'],
                  options: List<String>.from(eventData['options']).toList(),
                ))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    eventsSubscription.cancel();
    super.dispose();
  }

  void _vote(Event event, int optionIndex) {
    if (!event.hasVoted) {
      setState(() {
        event.hasVoted = true;
        event.selectedOptionIndex = optionIndex;
        event.votes[optionIndex]++;
      });
    } else {
      int previousVoteIndex = event.selectedOptionIndex;
      if (previousVoteIndex != optionIndex) {
        setState(() {
          event.votes[previousVoteIndex]--;
          event.votes[optionIndex]++;
          event.selectedOptionIndex = optionIndex;
        });
      }
    }
    Vote vote = Vote();
    vote.updateUserVotes(
        widget.groupName, event.id, event.options[optionIndex]);
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
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Event event = events[index];
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: CircleAvatar(),
                                  title: Text('${event.title}'),
                                  trailing: event.hasVoted
                                      ? null
                                      : IconButton(
                                          onPressed: () {
                                            // Delete event
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                ),
                                Text('${event.description}'),
                                const SizedBox(height: 8),
                                ...List.generate(event.options.length,
                                    (optionIndex) {
                                  return InkWell(
                                    onTap: () {
                                      _vote(event, optionIndex);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                LinearProgressIndicator(
                                                  minHeight: 30,
                                                  value: event.hasVoted
                                                      ? event.votes[
                                                              optionIndex] /
                                                          100.0
                                                      : 0,
                                                  backgroundColor: Colors.white,
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  height: 30,
                                                  child: Text(event
                                                      .options[optionIndex]),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            event.hasVoted
                                                ? '${event.votes[optionIndex]}%'
                                                : 'Tap to Vote',
                                            style: event.hasVoted
                                                ? TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : null,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                                event.hasVoted
                                    ? Text("Total Votes: ${event.totalVotes()}")
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
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
