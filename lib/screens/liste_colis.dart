import 'package:flutter/material.dart';
import 'package:todo_app/screens/task.dart';

class Colis extends StatefulWidget {
  const Colis({super.key});

  @override
  State<Colis> createState() => _ColisState();
}

class _ColisState extends State<Colis> {
  List<dynamic> colis = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            //Padding(padding: EdgeInsets.only(top: 10)),
            //const Padding(padding: EdgeInsets.only(top: 100,bottom: 0.5),),
            const Center(
              child: Text(
                "Mes Colis",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
                //margin: const EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        margin: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: GridView.count(
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          children: List.generate(colis.length, (index) {
                            //var id;
                            return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         DetailsProduit(produit: produits[index]["id"]),
                                //   ),
                                // );
                              },
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
