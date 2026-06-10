
import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/models/playlist.dart';
import 'package:earsong/models/song.dart';
import 'package:earsong/paginas/song_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PlaylistSongsScreen extends StatefulWidget{
  final Playlist playlist;
  const PlaylistSongsScreen({super.key, required this.playlist});

  @override
  State<StatefulWidget> createState() => _PlaylistSongsScreenState();
}



class _PlaylistSongsScreenState extends State<PlaylistSongsScreen>{

  Future<void> _songPick() async {
  
  FilePickerResult? result = await FilePicker.pickFiles(
    type: FileType.audio
  );
  if (result != null) {
    final path = result.files.single.path;
    if(path!=null){
      setState(() {
        widget.playlist.playlistSongs.add(
          Song(songName: result.files.single.name, songPath: path)
        );
      });
      
    }
  
  
  
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
      floatingActionButton: IconButton(onPressed: _songPick, icon: Icon(Icons.add, size: 80,)),

      body: ListView.builder(itemCount: widget.playlist.playlistSongs.length, itemBuilder: (BuildContext context, int index) { 
      final song = widget.playlist.playlistSongs[index];
      
      return ListTile(
        title: Text(song.songName),
        onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SongScreen(
                    playlist: widget.playlist, initialIndex: index,
                  ),
                ),
              );
            },




      );


       },),



      );
  }
}