







import 'package:earsong/componentes/main_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(title: Text("H O M E"), centerTitle: true,),
      drawer: MainDrawer(),
      body: Center(child: Text("Bem vindo a Earsong"))



    );


  }
    
  }