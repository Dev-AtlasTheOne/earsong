import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongControls extends StatelessWidget {
  const SongControls({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return IconButton(
            onPressed: player.play,
            icon: Icon(Icons.play_arrow, color: Colors.white, size: 80),
          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: player.pause,
            icon: Icon(Icons.pause, color: Colors.white, size: 80),
          );
        }
        return const Icon(Icons.play_arrow, color: Colors.white, size: 80);
      },
    );
  }
}
