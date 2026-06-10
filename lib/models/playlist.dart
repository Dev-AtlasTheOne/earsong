import 'package:earsong/models/song.dart';

class Playlist {
  final String playlistName;
  List<Song> playlistSongs=[
    Song(songName: "Base Song", songPath: "assets/audio/Die For You.mp3"),
    Song(songName: "Base Song2", songPath: "assets/audio/Never Gonna Give You Up.mp3")

  ];


  Playlist({required this.playlistName});



  set addSong(Song song){
    playlistSongs.add(song);



  }








}