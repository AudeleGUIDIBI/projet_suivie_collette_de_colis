import 'package:flutter/material.dart';

class RecherchesPage extends StatefulWidget {
  RecherchesPage({Key? key}) : super(key: key);

  @override
  State<RecherchesPage> createState() => _RecherchesPageState();
}

class _RecherchesPageState extends State<RecherchesPage> {
  List<dynamic> taches = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Barre de recherche"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          const SizedBox(height: 10.0) ,
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            height: 40.0,
            // width: 80.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (String libelle) {
              },
              cursorColor: Colors.purple,
              decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                hintText: "Faîtes vos recherches ici",
                prefixIcon: Icon(Icons.search, color: Colors.purple,),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: taches.length,
                itemBuilder: (BuildContext context, int index) {
                  return  ListTile(
                    title: InkWell(
                      onTap: () {
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsProduit(produit: produits[index]["id"])));
                      },
                      child: Text(
                        taches[index]["libelleprod"],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
