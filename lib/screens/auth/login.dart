import 'package:flutter/material.dart';
import 'package:banking_flutter_app/utils/utils.dart';
import '../../controllers/usercontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = UserController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Positions initiales des cercles
  Offset _circle1 = const Offset(30, 50);
  Offset _circle2 = const Offset(350, 150);
  Offset _circle3 = const Offset(80, 800);

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String? error = await _userController.login(
        _emailController.text,
        _passwordController.text,
      );

      if (error != null) {
        // ignore: use_build_context_synchronously
        showMessage(error, const Color.fromARGB(255, 222, 107, 99), context);
      } else {
        // ignore: use_build_context_synchronously
        showMessage("Connexion réussie !", Colors.green, context);
        // Navigator.pushNamed(context, '/home'); // Rediriger après connexion
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fond décoratif
          SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),

          // Cercles draggables
          _buildDraggableCircle(_circle1, Colors.green[800], (offset) {
            setState(() {
              _circle1 = offset;
            });
          }),
          _buildDraggableCircle(_circle2, Colors.green[900], (offset) {
            setState(() {
              _circle2 = offset;
            });
          }),
          _buildDraggableCircle(_circle3, Colors.green[700], (offset) {
            setState(() {
              _circle3 = offset;
            });
          }),

          // Formulaire
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Titre
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Use your email to login",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 50),

                      // Champ Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "L'email est requis";
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
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
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
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 35),

                      // Bouton Login
                      SizedBox(
                        height: 65,
                        width: 360,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.green[800]),
                          ),
                          onPressed: _login,
                          child: const Text(
                            "Log in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Lien pour s'inscrire
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              'Sign Up',
                          style:
                              TextStyle(fontSize: 14, color: Colors.green[800]),
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
        ],
      ),
    );
  }

  /// 🔥 Widget pour créer un cercle draggable
  Widget _buildDraggableCircle(Offset position, Color? color, Function(Offset) onDragEnd) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: _circleWidget(color), // Affiché pendant le déplacement
        childWhenDragging: Container(), // Cache le cercle à l'endroit d'origine
        onDragEnd: (details) {
          onDragEnd(details.offset); // Met à jour la position finale
        },
        child: _circleWidget(color), // Cercle de base
      ),
    );
  }

  /// 🌟 Widget Cercle
  Widget _circleWidget(Color? color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
