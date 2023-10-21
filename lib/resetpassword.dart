import 'package:flutter/material.dart';
import 'package:pischool/code-otp.dart';

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
                    decoration: const BoxDecoration(
                      color: Colors.white, // Couleur de fond blanche
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                            50), // Coin supérieur gauche arrondi
                        topRight:
                            Radius.circular(50), // Coin supérieur droit arrondi
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          _inputField(
                              "Adresse e-mail", TextEditingController()),
                          const SizedBox(height: 20),
                          _resetBtn(),
                          const SizedBox(
                              height:
                                  20), // Ajoute un espace entre les deux boutons
                          _otpButton(
                              context), // Bouton pour la page de code OTP
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

  Widget _inputField(String hintText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 200), // Ajout de décalage vers le bas
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white.withOpacity(0.2),
        ),
        child: TextField(
          style: const TextStyle(color: Colors.black),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.blue),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
    );
  }

  Widget _resetBtn() {
    return ElevatedButton(
      onPressed: () {
        // Logique pour réinitialiser le mot de passe
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 228, 226, 226),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Réinitialiser le mot de passe",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _otpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logique pour rediriger vers la page du code OTP
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              CodeOTPPage(), // Remplacez CodeOTPPage par le nom de votre page OTP
        ));
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue,
        backgroundColor: const Color.fromARGB(255, 228, 226, 226),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Code OTP",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Créez une classe CodeOTPPage pour la page de code OTP

