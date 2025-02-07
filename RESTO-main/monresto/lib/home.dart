import 'package:flutter/material.dart';
import 'package:monresto/MesWidgets/categories.dart';
import 'package:monresto/MesWidgets/ma_commande.dart';
import 'package:monresto/MesWidgets/mesPages.dart';
import 'package:monresto/MesWidgets/monPlat.dart';
import 'package:monresto/login.dart';
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Home extends StatefulWidget {
  bool isGetzner = false;
  bool isWiliams = false;
  bool isCache = false;
   int index = 0;
  Home(
      {super.key,
      required this.isGetzner,
      required this.isWiliams,
      required this.isCache , required this.index});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() =>
      // ignore: no_logic_in_create_state
      _HomeState(isGetzner: isGetzner, isWiliams: isWiliams, isCache: isCache, index:index);
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? paymentIntent;
  int index = 0;
  //Les variabls pour afficher les produits (tricherie 😂)
  bool isGetzner = false;
  bool isWiliams = false;
  bool isCache = false;
  _HomeState(
      {required this.isGetzner,
      required this.isWiliams,
      required this.isCache, required this.index});
  @override
  Widget build(BuildContext context) {
    final bdy = [
      //ACCEIL
      ListView(
        children: [
          monPlat(
              "Tussi getzner",
              "image/t.jpg",
              " un tussi international et mondiale",
              "6000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
          monPlat(
              "Tissu Williams",
              "image/s.jpg",
              "Un tussi 100% Malieene",
              "5000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
          monPlat(
              "Tussi Cache",
              "image/m.jpg",
              " un tussi en province du nigeria",
              "2000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
        ],
      ),
      //COMMADS
      Center(
        child: (isCache == true || isGetzner == true || isWiliams == true)
            ? Column(
                children: [
                  isGetzner == true
                      ? MaCommande(
                          isCache: isCache,
                          isGetzner: isGetzner,
                          isWiliams: isWiliams,
                          nom: "Tussi getzner",
                          urlImage: "image/t.jpg",
                          prix: 6000,
                        )
                      : Container(),
                  isWiliams == true
                      ? MaCommande(
                          isCache: isCache,
                          isGetzner: isGetzner,
                          isWiliams: isWiliams,
                          nom: "Tissu Williams",
                          urlImage: "image/s.jpg",
                          prix: 5000,
                        )
                      : Container(),
                  isCache == true
                      ? MaCommande(
                          isCache: isCache,
                          isGetzner: isGetzner,
                          isWiliams: isWiliams,
                          nom: "Tussi Cache",
                          urlImage: "image/m.jpg",
                          prix: 2000,
                        )
                      : Container(),
                ],
              )
            : const Text('Vous avez reserver aucune commande !'),
      ),
      //CATEGORIES
        //ACCEIL
      ListView(
        children: [
          maCategorie(
              "Tussi getzner",
              "image/t.jpg",
              " un tussi international et mondiale",
              "6000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
          maCategorie(
              "Tissu Williams",
              "image/s.jpg",
              "Un tussi 100% Malieene",
              "5000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
          maCategorie(
              "Tussi Cache",
              "image/m.jpg",
              " un tussi en province du nigeria",
              "2000 F",
              [
                "coton",
                "couleur",
                "peau d'animeau",
                "peinture",
              ],
              context),
        ],
      ),
   
      //PROFILE
      Center(
        child: Column(
          children: [
            //Carte pour le solde et depot/retrait
            Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: BorderSide.strokeAlignCenter,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5],
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //PARTIE SOLDE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOM SOLDE
                      const Text(
                        "Mon solde:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      //VALUE SOLDE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Icon
                              Icon(
                                Icons.wallet,
                                size: 40,
                              ),
                              //SOMME
                              Text(
                                "12,900.5 F",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          //Icon DE COPIER LE COMPTE
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.link,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //ESPACE VIDE
                  const SizedBox(
                    height: 20,
                  ),
                  //PARTIE BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //BUTTON DE DEPOT
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 2.5,
                        height: 50,
                        color: Colors.blueAccent,
                        onPressed: makePayment,
                        child: const Row(
                          children: [
                            //Icon
                            Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                            //espace vide
                            SizedBox(
                              width: 8,
                            ),
                            //Text
                            Text(
                              'Depot',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ESPACE VIDE
                      const SizedBox(
                        width: 12,
                      ),
                      //BUTTON DE RETRAIT
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 2.5,
                        height: 50,
                        color: Colors.blueAccent,
                        onPressed: makePayment,
                        child: const Row(
                          children: [
                            //Icon
                            Icon(
                              Icons.upload,
                              color: Colors.white,
                            ),
                            //espace vide
                            SizedBox(
                              width: 8,
                            ),
                            //Text
                            Text(
                              'Retrait',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ), //ESPACE VIDE
                ],
              ),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          index == 3 ? "Bienvenu, ILmahdi" : " Tisséo ",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
        leading: index == 3
            ? Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle),
                      child: Image.asset(
                        'image/dede.jpg',
                        fit: BoxFit.fill,
                      )),
                );
              })
            : Image.asset('image/logoResto.png'),
            actions:index==0? [
              Flexible(child: SizedBox(
                width: MediaQuery.of(context).size.width/1.7,
                child: TextF(controller: TextEditingController(), text: 'Recherche...', icon: Icons.search, )))
            ]:null,
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
          child: bdy[index]),

      ///
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        color: Colors.blue,
        child: Center(
          child: Row(
            children: [
              //ACCEUIL
              InkWell(
                splashColor: Colors.white,
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: mesPages(
                  Icons.home,
                  'Acceuil',
                  Colors.white,
                  30,
                  index != 0 ? Colors.blue : Colors.transparent,
                  index != 0 ? false : true,
                ),
              ),
              //COMMANDS
              InkWell(
                splashColor: Colors.white,
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: mesPages(
                  Icons.shopping_cart,
                  'Command',
                  Colors.white,
                  30,
                  index != 1 ? Colors.blue : Colors.transparent,
                  index != 1 ? false : true,
                ),
              ),
              //CATEGORIES
              InkWell(
                splashColor: Colors.white,
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: mesPages(
                  Icons.category,
                  'Categorie',
                  Colors.white,
                  30,
                  index != 2 ? Colors.blue : Colors.transparent,
                  index != 2 ? false : true,
                ),
              ),
              //Profile
              InkWell(
                splashColor: Colors.white,
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: mesPages(
                  Icons.person,
                  'Profil',
                  Colors.white,
                  30,
                  index != 3 ? Colors.blue : Colors.transparent,
                  index != 3 ? false : true,
                ),
              ),
            ],
          ),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      'image/dede.jpg',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Utilisateur',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Text(
                    'user@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Information personel'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Changer le mot de passe'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.security_rounded),
              title: const Text('Paramètres de confidentialite'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.supervised_user_circle_sharp),
              title: const Text('Service client'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ],
        ),
      ),
    );
  }

  ///////////////////
  ///
  ///
  ////
  ////
  ////
  ///
  ////
  ////
  ////
  ///
  ////
  Future<void> makePayment() async {
    try {
      // 1. Créer un PaymentIntent via l'API Stripe
      paymentIntent = await createPaymentIntent('1000', 'xof'); // 10 USD

      // 2. Initialiser la feuille de paiement Stripe
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Ma Boutique',
        ),
      );

      // 3. Afficher le formulaire de paiement
      await Stripe.instance.presentPaymentSheet();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Paiement réussi')),
      );
    } catch (e) {
      print('Erreur de paiement : $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Paiement échoué')),
      );
    }
  }

  // Fonction pour créer un PaymentIntent avec l'API Stripe
  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51Qo0mWAz4wFlmCVAJgc0l8voQMx231UjH7MsvBEkak6yUWSxVuH2DiS1c3qLUrLV7Q7ywiOMVDYdmt4R1CQfgzRQ00Rkpq9y89',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (err) {
      print('Erreur lors de la création du PaymentIntent: $err');
      throw Exception(err);
    }
  }
}
