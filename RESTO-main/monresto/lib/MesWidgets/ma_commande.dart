// CARD DE MES PLATS
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:monresto/home.dart'; // ignore: must_be_immutable

// ignore: must_be_immutable
class MaCommande extends StatefulWidget {
  bool isGetzner = false;
  bool isWiliams = false;
  bool isCache = false;
  String nom;
  String urlImage;
  double prix;
  MaCommande(
      {super.key,
      required this.nom,
      required this.urlImage,
      required this.prix, required this.isGetzner, required this.isWiliams, required this.isCache});

  @override
  // ignore: library_private_types_in_public_api
  _MaCommandeState createState() =>
      // ignore: no_logic_in_create_state
      _MaCommandeState(nom: nom, urlImage: urlImage, prix: prix, isGetzner: isGetzner, isWiliams: isWiliams, isCache: isCache);
}

class _MaCommandeState extends State<MaCommande> {
    bool isGetzner = false;
  bool isWiliams = false;
  bool isCache = false;
  String nom;
  String urlImage;
  double prix;
  _MaCommandeState(
      {required this.nom, required this.urlImage, required this.prix, required this.isGetzner, required this.isWiliams, required this.isCache});

      int multiplicateur=1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      child: Row(
        children: [
          //Image
          Image.asset(
            urlImage,
            width: 175,
            height: 150,
            fit: BoxFit.fill,
          ),
          //nom et prix et description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nom,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  '${prix.toStringAsFixed(1)} F',
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        
                       if(multiplicateur>0){
                         setState(() {
                          if(multiplicateur>1){
                            multiplicateur-= 1;
                          }
                          
                          prix=prix / multiplicateur;
                          
                        });
                       }
                      },
                      icon: const Icon(Icons.remove_circle),
                    ),
                    Text(
                      '$multiplicateur',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                         setState(() {
                          multiplicateur++;
                          prix += prix;
                        });
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Home(isGetzner: !isGetzner, isWiliams: !isWiliams, isCache: !isCache, index: 1,),),);
                        });
                      },
                      icon: const Icon(Icons.delete, color: Colors.red,),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
