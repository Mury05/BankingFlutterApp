import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fond avec une image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("/image1.jpg"), // Remplace avec ton image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Contenu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bouton Skip en haut à droite
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "",
                      ),
                    ),
                  ),
                ),

                Spacer(),

                // Texte principal
                Text(
                  "Step into\nthe banking\nfuture now",
                  style:TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                // Sous-texte
                Text(
                  "We will do everything but count coins.\nFaster, easier, and more convenient.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 60),

                // Ligne décorative
                Container(
                  height: 2,
                  width: 80,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green[900],
            ),
            onPressed: () {},
            child: Text("OPEN AN ACCOUNT >", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
