import 'package:flutter/material.dart';
import 'package:pischool/reset.dart'; // Importer la page de réinitialisation de mot de passe

class CodeOTPPage extends StatelessWidget {
  const CodeOTPPage({Key? key}) : super(key: key);
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
              children: [
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
                          _inputField("Code OTP", TextEditingController()),
                          const SizedBox(height: 40),
                          _validateBtn(),
                          const SizedBox(height: 20),
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

  Widget _inputField(String hintText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white,
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }

  Widget _validateBtn() {
    return ElevatedButton(
      onPressed: () {
        // Logique pour valider le code OTP
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
          "Valider",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _resetBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Logique pour rediriger vers la page du code OTP
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const ResetPasswordPage(), // Remplacez CodeOTPPage par le nom de votre page OTP
        ));
      },
      child: const Text(
        "Réinitialiser le mot de passe",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
      ),
    );
  }
}
