// CARD DE MES PLATS
import 'package:flutter/material.dart';
import 'package:monresto/details.dart';

InkWell monPlat(
  String nom,
  String urlImage,
  String description,
  String prix,
  List<String> ingredients,
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(
                    nom: nom,
                    urlImage: urlImage,
                    prix: prix,
                    description: description,
                    ingredient: ingredients,
                  )));
    },
    splashColor: Colors.blue,
    child: Card(
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  prix,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 150,
                  child: Text(description),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
