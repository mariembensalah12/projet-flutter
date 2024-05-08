import 'package:flutter/material.dart';
import 'package:projet/widget/academic.card.dart';
import '../../widget/widget.card.dart';


class ProjectPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projet Personelle'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          AcademicCard(
            institution: 'Site web E-commercce',
            description: '',
            degree: 'développeur backend pour un site web e-commerce',
            fieldOfStudy: '',
            dates: 'PHP, Laravel, et MySQL',
          ),
          AcademicCard(
            institution: 'DataMining',
            description: '',
            degree: 'système de prédiction de poids',
            fieldOfStudy: '',
            dates: 'Kaggel , Googel colab',
          ),
          AcademicCard(
            institution: 'Site Inventaire',
            description: '',
            degree: 'petite application qui permet de gérer efficacement le stock',
            fieldOfStudy: '',
            dates: 'C#, ASP.NET Core,SQL',
          ),
          AcademicCard(
            institution: 'Site Inventaire',
            description: '',
            degree: 'petite application qui permet de gérer efficacement le stock',
            fieldOfStudy: '',
            dates: 'PHP,MySQL',
          ),
        ],
      ),
    );
  }
}
