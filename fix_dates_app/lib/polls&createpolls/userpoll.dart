import 'package:flutter/material.dart';
import 'package:fix_dates_app/polls&createpolls/createpoll.dart';

class UserPoll extends StatefulWidget {
  final String eventId;
  final String groupName;

  const UserPoll({Key? key, required this.eventId, required this.groupName}) : super(key: key);

  @override
  State<UserPoll> createState() => _UserPollState();
}

class _UserPollState extends State<UserPoll> {
  bool _hasVoted = false;
  int _selectedOptionIndex = -1;
  List<int> _votes = [0, 0]; // Track votes for each option
  final List<String> _options = ["Bee honey", "Nikan Honey"];

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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ...List.generate(1, (index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              leading: CircleAvatar(),
                              title: const Text("Dineth"),
                              trailing: _hasVoted
                                  ? null
                                  : IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete),
                                    ),
                            ),
                            const Text("Honey"),
                            const SizedBox(
                              height: 8,
                            ),
                            ...List.generate(_options.length, (optionIndex) {
                              return InkWell(
                                onTap: () {
                                  _vote(optionIndex);
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
                                              value: _hasVoted
                                                  ? _votes[optionIndex] / 100
                                                  : 0,
                                              backgroundColor: Colors.white,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              height: 30,
                                              child: Text(_options[optionIndex]),
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
                                                fontWeight: FontWeight.bold)
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                            _hasVoted
                                ? Text("Total Votes: ${_totalVotes()}")
                                : const SizedBox()
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePoll()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
