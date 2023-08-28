import 'package:flutter/material.dart';
import 'package:todo_app/screens/inscription_screen.dart';

import 'menu_screen.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  bool isObscured = true;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(child: Text("Connexion"),)
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        color: Colors.white60,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Theme(
                  data: ThemeData(
                    primaryColor: Colors.red,
                    primaryColorDark: Colors.black,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.purple,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                      // prefix: Icon(Icons.mail),
                      //fillColor: Colors.white,
                      hintText: "email",
                      label: const Text("Email", style: TextStyle(color: Colors.purple),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(20.0),
                      //   borderSide: BorderSide(
                      //     color: Colors.purple,
                      //     width: 2.0
                      //   )
                      // )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Entrez un email";
                      }else
                      if (!value.contains('@')) {
                        return "Entrez un email valide";
                      }
                      return null;
                    },
                  ),
              ),
              const SizedBox(height: 8.0,),
              TextFormField(
                cursorColor: Colors.purple,
                obscureText: isObscured,
                keyboardType: TextInputType.text,
                controller: passwordController,
                decoration: InputDecoration(
                  // prefix: Icon(Icons.mail),
                  hintText: "mot de passe",
                  label: const Text("Mot de passe", style: TextStyle(color: Colors.purple),),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    child: Icon(
                      isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    //borderSide: BorderSide(style: BorderStyle.solid, color: Colors.purple),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Entrez un mot de passe";
                  }else
                    if (value.length < 8) {
                      return "Entrer encore ${8 - value.length} caractères";
                    }
                  return null;
                },
              ),
              const SizedBox(height: 8, width: 90,),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InscriptionScreen()));
              },
                  child: const Text(
                    "Vous n'avez pas de compte ?  S'inscrire",
                    style: TextStyle(
                      color: Colors.purple
                    ),
                  ),
              ),
              const SizedBox(height: 80,),
              ElevatedButton(
                //style: ButtonStyle(backgroundColor: MaterialStateProperty),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen()));
                    }
                  },
                  child:  const Text(
                    "Se Connecter",
                    style: TextStyle(
                      //backgroundColor: Colors.purple,
                      color: Colors.white
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15)
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
