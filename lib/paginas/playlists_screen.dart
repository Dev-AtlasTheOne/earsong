import 'package:earsong/componentes/load_data.dart';
import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/global/Global.dart';
import 'package:earsong/paginas/playlist_songs_page.dart';
import 'package:earsong/paginas/playlists_add_screen.dart';
import 'package:flutter/material.dart';

class PlaylistsScreen extends StatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  Future<void> editPlaylistName(int index) async {
    final controller = TextEditingController(
      text: Global.playlists.allPlaylists[index].playlistName,
    );

    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit playlist name"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "New name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        Global.playlists.allPlaylists[index].playlistName = result.trim();
      });

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
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlaylistsAddScreen()),
          );
          setState(() {});
        },
        icon: Icon(Icons.playlist_add, size: 80),
      ),

      body: ListView.builder(
        itemCount: Global.playlists.allPlaylists.length,
        itemBuilder: (BuildContext context, int index) {
          final playlist = Global.playlists.allPlaylists[index];

          return ListTile(
            title: Text(playlist.playlistName),
            leading: IconButton(
              onPressed: () async {
                await editPlaylistName(index);
              },
              icon: Icon(Icons.edit),
            ),
            trailing: IconButton(
              onPressed: () async {
                Global.playlists.removePlaylist(index);
                await LoadData.save(Global.playlists);
                setState(() {});
              },
              icon: Icon(Icons.remove),
            ),
            subtitle: Text("${playlist.playlistSongs.length} songs"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlaylistSongsScreen(playlistIndex: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
