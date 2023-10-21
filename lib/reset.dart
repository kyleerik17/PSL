import 'package:flutter/material.dart';
import 'login_page.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond (utilisez la même image que pour la page de connexion)
          Image.asset(
            'assets/bg-login.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo "PISCHOOL"
                Image.asset(
                  'assets/logoo.png',
                  width: 200,
                ),
                const SizedBox(height: 20),
                const Text(
                  "PISCHOOL",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          // Ajoutez les champs pour la réinitialisation du mot de passe ici
                          _inputField(
                              "Nouveau mot de passe", TextEditingController(),
                              isPassword: true),
                          const SizedBox(height: 20),
                          _inputField("Confirmez le mot de passe",
                              TextEditingController(),
                              isPassword: true),
                          const SizedBox(height: 20),
                          // Ajoutez le bouton pour réinitialiser le mot de passe ici
                          _resetBtn(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Widget _resetBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logique pour réinitialiser le mot de passe

        // Redirection vers la page de connexion (login_page.dart)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Réinitialiser le mot de passe",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
