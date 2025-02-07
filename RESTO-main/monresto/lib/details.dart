import 'package:flutter/material.dart';
import 'package:monresto/successCommande.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String nom;
  String urlImage;
  String prix;
  String description;
  List<String> ingredient;
  Details(
      {super.key,
      required this.nom,
      required this.urlImage,
      required this.prix,
      required this.description,
      required this.ingredient});

  @override
  _DetailsState createState() => _DetailsState(
        nom: nom,
        urlImage: urlImage,
        prix: prix,
        description: description,
        ingredient: ingredient,
      );
}

class _DetailsState extends State<Details> {
  String nom;
  String urlImage;
  String prix;
  String description;
  List<String> ingredient;
  _DetailsState(
      {required this.nom,
      required this.urlImage,
      required this.prix,
      required this.description,
      required this.ingredient});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Details du tissu",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
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
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 10,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nom,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  prix,
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            Text(
              description,
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ce tussi est fabriquer à base de ces elements: ',
              style: TextStyle(fontSize: 17),
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: ingredient.length,
                  itemBuilder: (context, index) {
                    final ingred = ingredient[index];
                    return Text(
                      '${index + 1}: $ingred',
                      style: TextStyle(fontSize: 17),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog.adaptive(
                  title: const Text('Voulez-vous commander maintenant ?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Non',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuccessCommande(isCache: nom == "Tussi Cache"? true:false, isGetzner: nom == "Tussi getzner"? true:false,isWilliams: nom == "Tissu Williams"? true:false,)));
                      },
                      child: Text(
                        'Oui',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                );
              });
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.blue, fixedSize: Size(300, 50)),
        child: const Text(
          "Commander",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
