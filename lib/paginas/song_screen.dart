import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:earsong/utilities/position_data.dart';
import 'package:earsong/componentes/song_controls.dart';
import 'package:earsong/models/playlist.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class SongScreen extends StatefulWidget {
  final Playlist playlist;
  final int initialIndex;
  const SongScreen({
    super.key,
    required this.playlist,
    required this.initialIndex,
  });

  @override
  State<StatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  late AudioPlayer _player;

  late List<AudioSource> currentPlaylist;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _loadPlaylist();
  }

  Future<void> _loadPlaylist() async {
    currentPlaylist = widget.playlist.playlistSongs.map((song) {
      return AudioSource.file(song.songPath);
    }).toList();

    await _player.setAudioSources(
      currentPlaylist,
      initialIndex: widget.initialIndex,
      preload: true,
    );

    await _player.play();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_downward),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.multitrack_audio_rounded, size: 50.0),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return ProgressBar(
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: _player.seek,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<SequenceState?>(
                    stream: _player.sequenceStateStream,
                    builder: (context, snapshot) {
                      return IconButton(
                        onPressed: _player.hasPrevious
                            ? () => _player.seekToPrevious()
                            : null,
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 50,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),

                  SongControls(player: _player),

                  StreamBuilder<SequenceState?>(
                    stream: _player.sequenceStateStream,
                    builder: (context, snapshot) {
                      return IconButton(
                        onPressed: _player.hasNext
                            ? () => _player.seekToNext()
                            : null,
                        icon: const Icon(
                          Icons.skip_next,
                          size: 50,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
