import 'package:flutter/material.dart';

class DemandeDeColetteDeColis extends StatefulWidget {
  const DemandeDeColetteDeColis({super.key});

  @override
  State<DemandeDeColetteDeColis> createState() => _DemandeDeColetteDeColisState();
}

class _DemandeDeColetteDeColisState extends State<DemandeDeColetteDeColis> {
  bool isObscured = true;
  final _formKey = GlobalKey<FormState>();
  final adresseController = TextEditingController();
  final telephoneController = TextEditingController();
  final numerocolisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            "Demande de collete de colis",
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
                  controller: adresseController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Adresse",
                    label: const Text(
                      "Adresse",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez une adresse";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: telephoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Telephone",
                    label: const Text(
                      "Telephone",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || !RegExp(r'^\d{8}$').hasMatch(value)) {
                      return "Entrez un numéro de téléphone valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: numerocolisController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Numero du colis",
                    label: const Text(
                      "Numero du colis",
                      style: TextStyle(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //gapPadding: 2.0,
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return "Entrez le numero du colis";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0,),
                ElevatedButton(
                    onPressed: ()
                    {

                    },
                    child: Text(
                      'Soumettre'
                    )
                ),
              ],
            )
        ),
      ),
    );
  }
}
