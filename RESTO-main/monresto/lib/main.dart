import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:monresto/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey =
      'pk_test_51Qo0mWAz4wFlmCVAf2H2oHdxUckX4yGUATw9Cy6HrAYpltZ60gHASxOAAPfe2xpSfIyDwdpvOAhIw5EKH3VIfulB00I15tfGC3';
  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final utilisateurActuel = FirebaseAuth.instance.currentUser;
              if (utilisateurActuel != null) {
                return Login();
              } else {
                return Login();
              }
            } else {
              return Login();
            }
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}
