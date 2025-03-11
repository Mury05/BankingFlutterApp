import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Méthode pour se connecter
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Connexion réussie
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // return "Aucun utilisateur trouvé avec cet email.";
        return "Identifiants incorrects.";
      } else if (e.code == 'wrong-password') {
        return "Identifiants incorrects.";
      }
      return "Erreur : ${e.message}";
    } catch (e) {
      return "Une erreur est survenue : $e";
    }
  }

  // Méthode pour récupérer l'utilisateur connecté
  User? get currentUser => _auth.currentUser;

  // Méthode pour récupérer les informations de l'utilisateur connecté
  Future<Map<String, dynamic>?> getUserInfo() async {
    try {
      User? user = currentUser;
      if (user == null) return null;

      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        return null; // L'utilisateur n'existe pas dans Firestore
      }
    } catch (e) {
      print(
          "Erreur lors de la récupération des informations de l'utilisateur : $e");
      return null;
    }
  }

  // Méthode pour récupérer les informations de l'utiisateur connecté

  // Méthode pour se déconnecter
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Méthode pour enregistrer un utilisateur
  Future<String?> register(
      String username, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Enregistrer le username et l'email dans le Firestore
        await _firestore.collection('users').doc(user.uid).set({
          "username": username,
          "email": email,
          "createdAt": FieldValue.serverTimestamp()
        });
      }

      return null; // Inscription réussie
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "L'email est déjà utilisé";
      } else if (e.code == 'weak-password') {
        return "Le mot de passe est trop faible";
      }
      return "Erreur : ${e.message}";
    } catch (e) {
      return "Une erreur est survenue : $e";
    }
  }
}
