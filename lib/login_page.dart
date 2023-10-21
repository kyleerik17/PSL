import 'package:flutter/material.dart';
import 'resetpassword.dart';
import 'inscription.dart';
import 'home.dart';

void main() => runApp(const MaterialApp(
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          _page(),
          _inscriptionButton(),
        ],
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _iconWithText(),
            const SizedBox(height: 50),
            _inputField("Username", usernameController, icon: Icons.person),
            const SizedBox(height: 20),
            _inputField("Password", passwordController,
                isPassword: true, icon: Icons.lock),
            const SizedBox(height: 20),
            _loginBtn(context),
            _resetPasswordButton(),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  Widget _iconWithText() {
    return Column(
      children: [
        Image.asset(
          'assets/logoo.png',
          width: 200,
        ),
        const SizedBox(height: 2),
        const Text(
          "PISCHOOL",
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
      ],
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false, IconData? icon}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white.withOpacity(0.5),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Colors.white,
                )
              : null,
        ),
        obscureText: isPassword,
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12.0),
          child: ElevatedButton(
            onPressed: () {
              String username = usernameController.text;
              String password = passwordController.text;

              if (username.isNotEmpty && password.isNotEmpty) {
                // Vous pouvez ajouter ici la logique d'authentification
                // Si l'authentification réussit, vous pouvez rediriger vers la page d'accueil.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(), // Redirection vers la page d'accueil
                  ),
                );
              } else {
                debugPrint("Veuillez remplir les champs de connexion.");
              }
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
                "Se connecter",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _resetPasswordButton() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ResetPasswordPage()),
              );
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
                "Mot de passe oublié",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _inscriptionButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InscriptionPage()),
            );
          },
          child: const Text(
            "Pas encore inscrit ? S'inscrire",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
