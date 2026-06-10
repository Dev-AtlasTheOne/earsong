import 'package:earsong/componentes/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();


  
}

class SettingsPageState extends State<SettingsPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("S E T T I N G S"), centerTitle: true, backgroundColor: Colors.transparent,),
      drawer: MainDrawer(),


    );
  }
}