import 'package:earsong/componentes/main_drawer.dart';
import 'package:earsong/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("S E T T I N G S"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.radio_button_checked, size: 100.0),
                  onPressed: () => {
                    Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme(),
                  },
                ),
                Text('Modo escuro'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
