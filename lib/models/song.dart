class Song {
  final String songName;
  final String songPath;

  Song({required this.songName, required this.songPath});

  Map<String, dynamic> toJson() {
    return {'songName': songName, 'songPath': songPath};
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(songName: json['songName'], songPath: json['songPath']);
  }
}
