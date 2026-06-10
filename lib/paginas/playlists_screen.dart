import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/models/playlists.dart';
import 'package:earsong/paginas/playlist_songs_page.dart';
import 'package:earsong/paginas/song_screen.dart';
import 'package:flutter/material.dart';

class PlaylistsScreen extends StatefulWidget{
  final Playlists playlists;
  const PlaylistsScreen({super.key, required this.playlists});

  @override
  State<StatefulWidget> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen>{



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
      

      body: ListView.builder(itemCount: widget.playlists.allPlaylists.length, itemBuilder: (BuildContext context, int index) { 
      final playlist = widget.playlists.allPlaylists[index];
      
      return ListTile(
        title: Text(playlist.playlistName),
        subtitle: Text(
              "${playlist.playlistSongs.length} songs",
            ),
        onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlaylistSongsScreen(
                    playlist: playlist,
                  ),
                ),
              );
            },




      );


       },),



      );
  }
}