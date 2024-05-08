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
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 1.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            AcademicCard(
              institution: 'Predicting weight',
              description: '',
              degree: 'creating a model based on food choices to predict individuals weights',
              fieldOfStudy: '',
              dates: 'DataMining',
            ),
            AcademicCard(
              institution: 'Stock management',
              description: '',
              degree: 'Web application to mange sales, purchases and invoicing',
              fieldOfStudy: '',
              dates: 'ASP.NET',
            ),
            AcademicCard(
              institution: 'Augmented reality project',
              description: '',
              degree: 'Creating a script that can detect ArUco markers',
              fieldOfStudy: '',
              dates: 'OPENCV',
            ),
            AcademicCard(
              institution: 'Chat Application',
              description: '',
              degree: 'creating a chat application using Sockets and Java Swing',
              fieldOfStudy: '',
              dates: 'JAVA',
            ),
            AcademicCard(
              institution: 'Virtual mouse ',
              description: '',
              degree: 'detects hand movements and gestures to control the mouses',
              fieldOfStudy: '',
              dates: 'OPENCV',
            ),
          ],
        ),
      ),
    );

  }
}
