



import 'package:earsong/paginas/home_screen.dart';
import 'package:earsong/paginas/playlists_screen.dart';
import 'package:earsong/paginas/settings_page.dart';
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
              onTap: () => {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()))
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("PLAYLISTS"),
              leading: Icon(Icons.list),
              onTap: () => {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlaylistsScreen()))
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(25),
            child: ListTile(
              title: Text("SETTINGS"),
              leading: Icon(Icons.settings),
              onTap: () => {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsPage()))
              },
            ),
          ),

        ],


      ),
      


    );
  }






}