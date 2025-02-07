import 'package:flutter/material.dart';
import 'package:monresto/backEnd/auth.dart';
import 'package:monresto/home.dart';
import 'package:monresto/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final passConf = TextEditingController();
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
                  "Sign Up",
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
                const SizedBox(
                  height: 10,
                ),
                TextF(
                  controller: passConf,
                  text: 'Confirmez votre mot de pass',
                  icon: Icons.lock,
                ),
                const SizedBox(
                  height: 23,
                ),
                TextButton(
                  onPressed: () async {
                    // Creer un utilisateur
                    if (email.text.isNotEmpty &&
                        pass.text.isNotEmpty &&
                        passConf.text.isNotEmpty) {
                      if (pass.text == passConf.text) {
                        try {
                          await creerUnUtilisateur(email.text, pass.text);
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
                        } catch (e) {
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Erreur"),
                            content: Text("Veuillez remplir tous les champs"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 50)),
                  child: const Text(
                    "S'enregistrer",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Vous avez déjà un compte ?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 140, 149, 152),
                          fontSize: 17),
                    ),
                    InkWell(
                      splashColor: Colors.black,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Se connecter',
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
