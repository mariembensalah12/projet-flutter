import 'package:flutter/material.dart';

class ProfessionalCard extends StatelessWidget {
  final String nomSociete;
  final String nomStage;
  final String duree;
  final String description;

  ProfessionalCard({
    required this.nomSociete,
    required this.nomStage,
    required this.duree,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16), // Augmentation de la marge autour de la carte
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Augmentation du rayon des coins de la carte
        side: BorderSide(width: 2), // Bordure bleue
      ),
      child: Padding(
        padding: EdgeInsets.all(20), // Augmentation du padding interne de la carte
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                nomSociete,
                style: TextStyle(
                  fontSize: 20, // Augmentation de la taille de la police
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 12), // Augmentation de l'espacement entre les éléments
              Text(
                nomStage,
                style: TextStyle(
                  fontSize: 18, // Augmentation de la taille de la police
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                duree,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 20, // Augmentation de la taille de la police
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
