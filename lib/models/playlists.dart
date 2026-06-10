import 'playlist.dart';

class Playlists {
  List<Playlist> allPlaylists;

  Playlists({
    List<Playlist>? allPlaylists,
  }) : allPlaylists = allPlaylists ?? [];

  void addPlaylist(Playlist playlist) {
    allPlaylists.add(playlist);
  }

  void removePlaylist(int index) {
    allPlaylists.removeAt(index);
  }

  void renamePlaylist(int index, String newName) {
    allPlaylists[index].playlistName = newName;
  }

  Map<String, dynamic> toJson() {
    return {
      'allPlaylists':
          allPlaylists.map((playlist) => playlist.toJson()).toList(),
    };
  }

  factory Playlists.fromJson(Map<String, dynamic> json) {
    return Playlists(
      allPlaylists: (json['allPlaylists'] as List)
          .map((playlist) => Playlist.fromJson(playlist as Map<String, dynamic>))
          .toList(),
    );
  }
}