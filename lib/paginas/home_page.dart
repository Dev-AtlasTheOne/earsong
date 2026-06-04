import 'package:earsong/paginas/playlist_page.dart';
import 'package:earsong/paginas/settings_page.dart';
import 'package:earsong/paginas/song_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  AppBar mainBar() {
    return AppBar(
      title: Text("Earsong"),
      centerTitle: true,

      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.location_city)),
          Tab(icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: mainBar(),
        body: TabBarView(
          children: [SongPage(), PlaylistPage(), SettingsPage()],
        ),
      ),
    );
  }
}
