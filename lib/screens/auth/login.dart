import 'package:flutter/material.dart';
import '../../controllers/usercontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController _usercontroller = UserController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String? error =
          _usercontroller.login(_usernameController.text, _passwordController.text);
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: Duration(seconds: 4),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Connexion réussie ✅",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            duration: Duration(seconds: 4),
          ),
        );
        Navigator.pushNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image en haut
                  // Image.asset(
                  //   "assets/images/login.png", // Assure-toi que l'image est bien ajoutée dans pubspec.yaml
                  //   height: 150,
                  //   width: 150,
                  // ),
                  SizedBox(height: 20),

                  // Titre
                  Text(
                    "Welcome Back",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green[800]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Use your email or username to login",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 50),

                  // Champ Email / Username
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Email or Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "L'email ou le username est requis";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),

                  // Champ Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Le mot de passe est requis";
                      } else if (value.length < 6) {
                        return "Min. 6 caractères";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 35),

                  // Bouton Login
                  SizedBox(
                    height: 65,
                    width: 360,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green[800]),
                      ),
                      onPressed: _login,
                      child: Text("Log in", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 50),

                  // Lien pour s'inscrire
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 14, color: Colors.green[800]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
