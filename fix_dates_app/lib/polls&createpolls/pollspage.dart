// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PollsPage extends StatefulWidget {
  const PollsPage({super.key});

  @override
  State<PollsPage> createState() => _PollsPageState();
}

class _PollsPageState extends State<PollsPage> {
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
                    ...List.generate(3, (index) {
                      return Container(
                     margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding:
                              const EdgeInsets.all(0),
                          leading: CircleAvatar(),
                          title: Text("Dineth"),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share)),
                            ),
                            const Text("My Question"),
                            const SizedBox(
                              height: 8,
                            ),
                            ...List.generate(2, (index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          LinearProgressIndicator(
                                            minHeight: 30,
                                            value: 5/100,
                                            backgroundColor: Colors.white,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10
                                            ),
                                            height: 30,
                                            child: Text("Trunk"),
                                          )
                                        ],
                                      ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text("5%"),
                                  ],
                                ),
                              );
                            }),
                            const Text("Total Votes: 10")
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
    );
  }
}