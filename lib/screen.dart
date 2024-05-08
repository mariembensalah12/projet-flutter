import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet/main.dart';
import 'package:projet/pages/home.page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 20), // Durée de l'écran de démarrage
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Helmi'), // Remplacez MyApp() par votre écran principal
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/ccclogo-Photoroom.png-Photoroom.png'), // Remplacez le chemin par votre propre image
            SizedBox(height: 20),
            Text("curriculum vitae",
              style: TextStyle(fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 32),)
          ],
        ),

      ),
    );

  }
}
