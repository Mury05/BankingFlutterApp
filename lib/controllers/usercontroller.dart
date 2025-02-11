import 'package:firebase_auth/firebase_auth.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour se connecter
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(currentUser);
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

      print(userCredential.user?.email);

      // Ici, tu peux stocker `username` dans Firestore si nécessaire
      // Exemple : FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({'username': username, 'email': email});

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
