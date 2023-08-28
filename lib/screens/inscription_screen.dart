import 'package:flutter/material.dart';
import 'package:todo_app/screens/menu_screen.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  bool isObscured = true;
  final _formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            "Inscription",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nomController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Nom",
                    label: const Text(
                        "Nom",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez un nom";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: prenomController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Prenom",
                    label: const Text(
                      "Prenom",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez un prénom";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    label: const Text(
                      "Email",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez un email";
                    } else
                      if (!value.contains("@")) {
                        return "Entrez un email valide";
                      }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: isObscured,
                  decoration: InputDecoration(
                    hintText: "Mot de passe",
                    label: const Text(
                      "Mot de passe",
                      style: TextStyle(color: Colors.purple),
                    ),
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
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez un mot de passe";
                    } else
                    if (value.length < 8) {
                      return "Entrer encore ${8 - value.length} caractères";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: confirmpasswordController,
                  keyboardType: TextInputType.text,
                  obscureText: isObscured,
                  decoration: InputDecoration(
                    hintText: "Confirmer votre mot de passe",
                    label: const Text(
                      "Mot de passe",
                      style: TextStyle(color: Colors.purple),
                    ),
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
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez un mot de passe";
                    } else
                    if (value.length < 8) {
                      return "Entrer encore ${8 - value.length} caractères";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0,),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: const Text(
                              "Inscription réussie",
                              style: TextStyle(color: Colors.purple),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MenuScreen()));
                                  },
                                  child: Text("Ok", style: TextStyle(color: Colors.purple),)
                              ),
                            ],
                          ),
                        );
                      },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15)
                    ),
                      child: const Text("Envoyer"),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
