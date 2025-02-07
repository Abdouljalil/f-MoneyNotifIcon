import 'package:firebase_auth/firebase_auth.dart';

// FONCTION POUR CREER UN UTILISATEUR DANS FIREBASE AUTH
Future<void> creerUnUtilisateur(String email, String password) async {
  try {
    UserCredential _auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // User is successfully created
    print('User created: ${_auth.user}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    // ... other error codes
  } catch (e) {
    print(e);
  }
}

// FONCTION POUR SE CONECER UN UTILISATEUR DANS FIREBASE AUTH
Future<void> seconnecterUnUtilisateur(String email, String password) async {
  try {
    UserCredential _auth = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // User is successfully created
    print('User created: ${_auth.user}');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    // ... other error codes
  } catch (e) {
    print(e);
  }
}
