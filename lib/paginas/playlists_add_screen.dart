import 'package:earsong/utilities/load_data.dart';
import 'package:earsong/global/Global.dart';
import 'package:earsong/models/playlist.dart';
import 'package:flutter/material.dart';

class PlaylistsAddScreen extends StatefulWidget {
  const PlaylistsAddScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PlaylistsAddScreenState();
}

class _PlaylistsAddScreenState extends State<PlaylistsAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomePlaylistController = TextEditingController();

  @override
  void dispose() {
    _nomePlaylistController.dispose();
    super.dispose();
  }

  TextFormField textField(
    TextEditingController controller,
    String label,
    String tip,
    IconData textIcon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(textIcon),
        hintText: tip,
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Sua playlist precisa ter um nome";
        }
        return null;
      },
    );
  }

  ElevatedButton sendButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final newPlaylist = Playlist(
            playlistName: _nomePlaylistController.text,
            playlistSongs: [],
          );
          setState(() {
            Global.playlists.addPlaylist(newPlaylist);
          });
          await LoadData.save(Global.playlists);

          if (!context.mounted) return;

          Navigator.pop(context);
        }
      },
      child: Icon(Icons.send),
    );
  }

  Form formBody() {
    return Form(
      key: _formKey,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textField(
            _nomePlaylistController,
            "Nome",
            "O nome que a playlist terá",
            Icons.text_fields,
          ),
          
        ],
      ),
    );
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
          padding: EdgeInsetsGeometry.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              formBody(),
              sendButton(context),


            ],
          ),


        ),

      ),
    );
  }
}
