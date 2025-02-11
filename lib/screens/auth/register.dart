import 'package:banking_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../controllers/usercontroller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final UserController _userController = UserController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeFirebase();
  // }

  // Future<void> _initializeFirebase() async {
  //   await Firebase.initializeApp();
  // }

 void _register() async {
  if (_formKey.currentState!.validate()) {
    String? error = await _userController.register(
      _usernameController.text,
      _emailController.text,
      _passwordController.text,
      );

    if (error != null) {
      // ignore: use_build_context_synchronously
      showMessage(error, Colors.red, context);
    } else {
      // ignore: use_build_context_synchronously
      showMessage("Compte créé avec succès !", Colors.green, context,);
      Navigator.pushNamed(context, '/login');
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
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Create an Account",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),

                  // Champ Username
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Le username est requis";
                      } else if (value.length < 3) {
                        return "Minimum 3 caractères";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),

                  // Champ Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "L'email est requis";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Format d'email invalide";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),

                  // Champ Password
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Mot de passe",
                      border: const OutlineInputBorder(),
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
                  const SizedBox(height: 25),

                  // Champ Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Confirmer le mot de passe",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirmation requise";
                      } else if (value != _passwordController.text) {
                        return "Les mots de passe ne correspondent pas";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 35),

                  // Bouton Inscription
                  SizedBox(
                    height: 65,
                    width: 360,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.green[800]),
                        ),
                        onPressed: _register,
                      child: const Text("S'inscrire", style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text('Already have an account? '),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green[800]),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
