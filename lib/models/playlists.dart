import 'package:earsong/models/playlist.dart';

class Playlists {

  List<Playlist> allPlaylists=[
    Playlist(playlistName: "basePlaylist"),


  ];


  set addPlaylist(Playlist playlist){

    allPlaylists.add(playlist);


  }





}