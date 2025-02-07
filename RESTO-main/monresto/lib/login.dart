import 'package:flutter/material.dart';
import 'package:monresto/backEnd/auth.dart';
import 'package:monresto/home.dart';
import 'package:monresto/sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Colors.white,
          ],
          stops: [0.1, 0.9],
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(
                    "image/logoResto.png",
                    height: 175,
                    width: 700,
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextF(
                  controller: email,
                  text: 'Entrer votre email',
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextF(
                  controller: pass,
                  text: 'Entrer votre mot de pass',
                  icon: Icons.lock,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
                TextButton(
                  onPressed: () async {
                    if (email.text.isNotEmpty && pass.text.isNotEmpty) {
                      try {
                        // Se connecter UN UTILISATEUR
                        await seconnecterUnUtilisateur(email.text, pass.text);
                        //NAVIGER VERS HOME
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(
                                      index: 0,
                                      isGetzner: false,
                                      isCache: false,
                                      isWiliams: false,
                                    )));
                      } catch (e) {}
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez remplir tous les champs"),
                        ),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  child: const Text(
                    "Se conneter",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Row(
                  children: [
                    Flexible(
                        child: Divider(
                      color: Colors.blue,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ou se connecter avec',
                        style: TextStyle(
                            color: Color.fromARGB(255, 4, 41, 71),
                            fontSize: 15),
                      ),
                    ),
                    Flexible(
                        child: Divider(
                      color: Colors.blue,
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'image/fmoney.webp',
                          width: 45,
                          height: 45,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'image/facebook.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'image/google.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Vous n'avez pas de compte ?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 140, 149, 152),
                          fontSize: 17),
                    ),
                    InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: const Text(
                        'Céer un compte',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextF extends StatelessWidget {
  TextF(
      {super.key,
      required this.controller,
      required this.text,
      required this.icon});
  TextEditingController controller;
  String text;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white60,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: text,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 98, 128, 152),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
