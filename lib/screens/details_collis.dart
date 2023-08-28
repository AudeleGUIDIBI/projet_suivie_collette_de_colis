import 'package:flutter/material.dart';

import '../services/api_service.dart';

class DetailsColis extends StatefulWidget {
  int colis;
  DetailsColis({super.key, required this.colis,});

  @override
  DetailsColisState createState() => DetailsColisState();
}

class DetailsColisState extends State<DetailsColis> {
  int _quantite = 1;
  bool refresh = true;
  List<dynamic> colis = [];
  String trackingNumber = "";
  String status = "";
  String location = "";


  void initData() async {
    final dataprod = await ApiServices.getColisById(widget.colis);
    if (refresh == true) {
      setState(() {
        colis = dataprod;
        print(colis);
        trackingNumber= colis[0]['trackingNumber'];
        status= colis[0]['status'];
        location=colis[0]['location'];
      });
      refresh = false;
    }
  }


  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        title: const Text("Détail Produit"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.indigo,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              trackingNumber,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'status: $status',
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '$location',
                      textAlign: TextAlign.start,
                      style:
                      const TextStyle(color: Colors.grey,
                          fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
