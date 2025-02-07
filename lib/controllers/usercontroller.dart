import '../models/user.dart';

class UserController {
  // Méthode pour connecter un utilisateur
  String? login(String username, String password) {
    final user = users.firstWhere(
      (user) =>
          user.username == username ||
          user.email == username && user.password == password,
      orElse: () => User(email: '', username: '', password: ''),
    );
    if (user.username.isEmpty) {
      return 'Nom d’utilisateur ou mot de passe invalide';
    }
    return null; // Connexion réussie
  }

  // Méthode pour enregistrer un nouvel utilisateur
  String? register(String username, String email, String password) {
    if (users.any((user) => user.username == username)) {
      return 'Le nom d’utilisateur est déjà pris';
    }

    if (users.any((user) => user.email == email)) {
      return 'L\'email est déjà utilisé';
    }

    // Vous pouvez ajouter une vérification d'email ici si nécessaire

    // Ajout d'un nouvel utilisateur à la liste
    users.add(User(email: email, username: username, password: password));
    return null; // Inscription réussie
  }
}
