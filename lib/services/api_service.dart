import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiUrl = "http://172.0.0.1:8000";

  // Les méthodes utilisées dans l'application

  //Récupération de tous les colis
  static Future getColisList() async {
    String simpleurl = '$apiUrl/api/colis/all';
    http.Response response = await http.get(Uri.parse(simpleurl), headers: {'Content-type': 'application/json'});
    return json.decode(response.body);
  }

  //Récupération des détails d'un colis à partir de son id
  static Future getColisById(trackingNumber) async {
    String simpleurl = '$apiUrl/api/colis/detail?id=$trackingNumber';
    http.Response response = await http.get(Uri.parse(simpleurl), headers: {'Content-type': 'application/json'});
    return json.decode(response.body);
  }

  //Authentification
  static Future login(String email, String password) async {
    String simpleurl = '$apiUrl/api/login/user';
    http.Response response = await http.post(
        Uri.parse(simpleurl),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
        encoding: Encoding.getByName('utf-8')
    );
    return json.decode(response.body);
  }

  // Inscription
  static Future sign_in(String nompers, String prenom, String email, String sexe, String telephone, String adresse, String password) async {
    String simpleurl = '$apiUrl/api/add_users';
    http.Response response = await http.post(
        Uri.parse(simpleurl),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"email": email, "password": password, "nompers": nompers, "prenom": prenom, "sexe": sexe, "telephone": telephone, "adresse": adresse,}),
        encoding: Encoding.getByName('utf-8')
    );
    return response.body;
  }

//demande de collette de colis
  static Future create_new_demand(int id, String adresse, int telephone, String trackingNumber, String status, String location) async {
    String simpleurl = '$apiUrl/api/commandNew';
    http.Response response = await http.post(
        Uri.parse(simpleurl),
        headers: {'Content-type': 'application/json'},
        body: json.encode({"id": id, "adresse": adresse, "telephone": telephone, "trackingNumber": trackingNumber,"status": status, "location": location}),
        encoding: Encoding.getByName('utf-8')
    );
    print(response.body);
    return response.body;
  }


}