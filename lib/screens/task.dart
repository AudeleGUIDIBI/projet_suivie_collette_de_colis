import 'package:flutter/material.dart';
import 'package:todo_app/screens/menu_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  bool isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final titreController = TextEditingController();
  final categorieController = TextEditingController();
  final descriptionController = TextEditingController();
  final planningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            const Text(
                "Enrégistrer une nouvelle tâche",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(width: 40,),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      content: const Text(
                        "Tâche enrégistrée",
                        style: TextStyle(color: Colors.purple),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuScreen()));
                            },
                            child: const Text("Ok", style: TextStyle(color: Colors.purple, fontSize: 16),)
                        )
                      ],
                    ),
                );
              },
              child: const Icon(Icons.check_sharp),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        //margin: const EdgeInsets.only(left: 5, right: 5),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titreController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                  icon: Icon(Icons.create_outlined, color: Colors.purple,),
                  hintText: "Donnez le nom de la tâche"
                ),
                validator: (value) {
                  if (value == null) {
                    return "Entrez un nom de tâche";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: categorieController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                    icon: Icon(Icons.collections, color: Colors.purple,),
                    hintText: "Donnez la catégorie de la tâche"
                ),
                validator: (value) {
                  if (value == null) {
                    return "Entrez un nom de tâche";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      icon: Icon(
                        isSelected ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
                        color: Colors.purple,
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          // if(isSelected == true) {
                          //   const Text(
                          //     "Terminée",
                          //     style: TextStyle(
                          //       color: Colors.black54,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //   );
                          // }
                        });
                      },
                      child: const Text(
                          "Non Terminée",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: descriptionController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                    icon: Icon(Icons.description_rounded, color: Colors.purple,),
                    hintText: "Ajouter une description"
                ),
                // validator: (value) {
                //   if (value == null) {
                //     return "Entrez un nom de tâche";
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: planningController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.purple,
                decoration: const InputDecoration(
                    icon: Icon(Icons.padding_outlined, color: Colors.purple,),
                    hintText: "Plannifier votre tâche"
                ),
                // validator: (value) {
                //   if (value == null) {
                //     return "Entrez un nom de tâche";
                //   }
                //   return null;
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
