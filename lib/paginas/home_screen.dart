import 'package:earsong/componentes/load_data.dart';
import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/global/Global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadPlaylists();
  }

  Future<void> loadPlaylists() async {
    Global.playlists = await LoadData.load();

    setState(() {});
  }

  Future<void> savePlaylists() async {
    await LoadData.save(Global.playlists);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("H O M E"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: MainDrawer(),
      body: Center(child: Text("Bem vindo a Earsong")),
    );
  }
}
