



import 'package:earsong/models/playlists.dart';
import 'package:earsong/paginas/playlists_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key});






  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          DrawerHeader(child: Center(child: Text("E A R S O N G"),),),
          

          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("HOME"),
              leading: Icon(Icons.home),
              onTap: () => {},
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("SONGS"),
              leading: Icon(Icons.music_note),
              onTap: () => {},
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("PLAYLISTS"),
              leading: Icon(Icons.list),
              onTap: () => {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlaylistsScreen(playlists: Playlists(),),))
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("SETTINGS"),
              leading: Icon(Icons.settings),
              onTap: () => {},
            ),
          ),

        ],


      ),
      


    );
  }






}