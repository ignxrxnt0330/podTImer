import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      "Cueing up the intro music...",
      "Editing out the awkward pauses...",
      "Loading the guest's hot takes...",
      "Buffering the juicy anecdotes...",
      "Syncing the perfect sound effects...",
      "Prepping the host's coffee...",
      "Finding the lost episode archives...",
      "Compressing the audio for crispness...",
      "Writing the show notes...",
      "Setting up the virtual studio...",
      "Dialing in the guest's connection...",
      "Trimming the long tangents...",
      "Adding the sponsor messages...",
      "Testing the mic levels...",
      "Queueing up the listener questions...",
      "Polishing the episode title...",
      "Loading the dramatic cliffhangers...",
      "Syncing the cross-promo ads...",
      "Prepping the host's witty banter...",
      "Rolling the outro music...",
    ];
    return Stream.periodic(const Duration(milliseconds: 3000), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("please wait..."),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(
              strokeWidth: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder(
                stream: getLoadingMessages(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text("Loading...");
                  return Text(snapshot.data!);
                })
          ],
        ),
      ),
    );
  }
}
