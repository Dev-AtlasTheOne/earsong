import 'package:earsong/models/song.dart';

class Playlist {
  String playlistName;
 
  List<Song> playlistSongs;


  Playlist({required this.playlistName, required this.playlistSongs});



  set addSong(Song song){
    playlistSongs.add(song);



  }

  Map<String, dynamic> toJson() {
    return {
      'playlistName': playlistName,
     
      'playlistSongs':
          playlistSongs.map((song) => song.toJson()).toList(),
    };
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      playlistName: json['playlistName'],
      playlistSongs: (json['playlistSongs'] as List)
          .map((song) => Song.fromJson(song as Map<String, dynamic>))
          .toList(),
    );
  }






}