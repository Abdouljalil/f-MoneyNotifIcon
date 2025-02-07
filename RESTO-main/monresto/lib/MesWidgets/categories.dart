// CARD DE MES PLATS
import 'package:flutter/material.dart';
import 'package:monresto/home.dart';

InkWell maCategorie(
  String nom,
  String urlImage,
  String description,
  String prix,
  List<String> ingredients,
  BuildContext context,
) {
  return InkWell(
    onTap: () {
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Home(isGetzner: true, isWiliams: false, isCache: !false, index: 0,),),);
                     
    },
    splashColor: Colors.blue,
    child: Card(
      color: Colors.white,
      elevation: 8,
      child: Column(
        children: [
          //Image
          Image.asset(
            urlImage,
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 5,
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
