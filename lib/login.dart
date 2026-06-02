
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  

  @override
  State<StatefulWidget> createState() => _TelaLogin();
}

class _TelaLogin extends State<Login>{

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();



  AppBar barra(){
    return AppBar(
      title: Text("Login"),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    );
  }

  corpo() {
    return SingleChildScrollView(


      child: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: form(),
      
      
      
      ),

    );
  }



  TextField(TextEditingController controller, String label, String textFieldTip, IconData textIcon){
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(textIcon),
          hintText: textFieldTip,
          labelText: label


        ),

        validator: (value){
          if(value == null || value.isEmpty){
            return 'este campo precisa ser preenchido';
          }
          return null;
        }


      );

  }


  form(){
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextField(_nomeController, 'Nome', 'O nome do seu usuário', Icons.person),
          TextField(_senhaController, 'Senha', 'A senha do seu usuário', Icons.password)


        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barra(),
      body: corpo(),
    );
  }

  

}