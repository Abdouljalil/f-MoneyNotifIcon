import 'package:flutter/material.dart';
import 'package:monresto/home.dart';

// ignore: must_be_immutable
class SuccessCommande extends StatelessWidget {
  bool isCache = false;
  bool isGetzner = false;
  bool isWilliams = false;
  SuccessCommande({super.key, required this.isCache, required this.isGetzner, required this.isWilliams});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon
              const Icon(
                Icons.check_circle,
                color: Colors.greenAccent,
                size: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              //Text ou message
              const Text(
                'Bravo ! Votre commande a été un succé.',
              ),
              const SizedBox(
                height: 20,
              ),
              //BOTTON OK
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    backgroundColor: Colors.blue,
                    fixedSize: Size(100, 40)),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home(isGetzner: isGetzner, isWiliams: isWilliams, isCache: isCache,index: 1,)));
                },
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //BOTTON OK
            ],
          ),
        ),
      ),
    );
  }
}
