import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  List<Map<String, dynamic>> genders = [];
  Map<String, dynamic>? selectedGender;
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController pseudoController = TextEditingController();
  TextEditingController motDePasseController = TextEditingController();
  TextEditingController carteIdentiteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchGenders();
  }

  Future<void> _fetchGenders() async {
    final response = await http.get(
      Uri.parse('https://service.pi-school.pi357.tech/api/v1/genders'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['data'] is List) {
        setState(() {
          genders = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {
        debugPrint('La réponse JSON ne contient pas de liste de genres.');
      }
    } else {
      debugPrint('Échec de la requête HTTP');
    }
  }

  Widget _genderDropdown() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: DropdownButton<Map<String, dynamic>>(
        value: selectedGender,
        items: genders.map((gender) {
          return DropdownMenuItem<Map<String, dynamic>>(
            value: gender,
            child: Text(gender['label'],
                style: const TextStyle(color: Colors.black)),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedGender = value;
          });
        },
        hint: const Text("Sélectionnez le genre",
            style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bg-login.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logoo.png',
                  width: 300,
                  height: 150,
                ),
                const Text(
                  "PISCHOOL",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                _inputField("Nom :", false, nomController),
                _inputField("Prénom :", false, prenomController),
                _inputField("Email :", false, emailController),
                _inputField("Mot de passe :", true, motDePasseController),
                _inputField("Téléphone :", false, telephoneController),
                _inputField("Pseudo :", false, pseudoController),
                _inputField(
                    "Carte d'identité :", false, carteIdentiteController),
                genders.isEmpty
                    ? CircularProgressIndicator()
                    : _genderDropdown(),
                ElevatedButton(
                  onPressed: () {
                    String nom = nomController.text;
                    String prenom = prenomController.text;
                    String email = emailController.text;
                    String motDePasse = motDePasseController.text;
                    String genre = selectedGender?['id'].toString() ?? '';
                    String telephone = telephoneController.text;
                    String carteIdentite = carteIdentiteController.text;

                    if (nom.isNotEmpty &&
                        prenom.isNotEmpty &&
                        email.isNotEmpty &&
                        motDePasse.isNotEmpty &&
                        genre.isNotEmpty &&
                        telephone.isNotEmpty &&
                        carteIdentite.isNotEmpty) {
                      // Vous pouvez insérer ici la logique pour gérer l'inscription
                      // Pour l'instant, nous laisserons cette partie vide.
                      debugPrint('Inscription réussie');
                    } else {
                      debugPrint(
                          "Veuillez remplir tous les champs d'inscription.");
                    }
                  },
                  child: const Text("S'inscrire"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(
      String hintText, bool isPassword, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        obscureText: isPassword,
      ),
    );
  }
}
