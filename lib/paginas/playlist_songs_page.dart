import 'package:earsong/componentes/load_data.dart';
import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/global/Global.dart';
import 'package:earsong/models/song.dart';
import 'package:earsong/paginas/song_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PlaylistSongsScreen extends StatefulWidget {
  final int playlistIndex;
  const PlaylistSongsScreen({super.key, required this.playlistIndex});

  @override
  State<StatefulWidget> createState() => _PlaylistSongsScreenState();
}

class _PlaylistSongsScreenState extends State<PlaylistSongsScreen> {
  Future<void> _songPick() async {
    FilePickerResult? result = await FilePicker.pickFiles(type: FileType.audio);
    if (result != null) {
      final path = result.files.single.path;
      if (path != null) {
        setState(() {
          Global.playlists.allPlaylists[widget.playlistIndex].playlistSongs.add(
            Song(songName: result.files.single.name, songPath: path),
          );
        });
      }
      await LoadData.save(Global.playlists);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("P L A Y L I S T S"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: MainDrawer(),
      floatingActionButton: IconButton(
        onPressed: _songPick,
        icon: Icon(Icons.add, size: 80),
      ),

      body: ListView.builder(
        itemCount: Global
            .playlists
            .allPlaylists[widget.playlistIndex]
            .playlistSongs
            .length,
        itemBuilder: (BuildContext context, int index) {
          final song = Global
              .playlists
              .allPlaylists[widget.playlistIndex]
              .playlistSongs[index];

          return ListTile(
            title: Text(song.songName),
            leading: Icon(Icons.music_note),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongScreen(
                    playlist:
                        Global.playlists.allPlaylists[widget.playlistIndex],
                    initialIndex: index,
                  ),
                ),
              );
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                setState(() {
                  Global.playlists.allPlaylists[widget.playlistIndex]
                      .removeSong(index);
                });

                await LoadData.save(Global.playlists);
              },
            ),
          );
        },
      ),
    );
  }
}
