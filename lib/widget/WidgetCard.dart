import 'package:flutter/material.dart';
import 'package:projet/pages/home.cv..page.dart';

class MyCardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  final String aboutMe;
  final String fonction;
  final String imagePath;
  final String link;
  final String instag;
  final String git;


  MyCardWidget({ required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.aboutMe,
    required this.fonction,
    required this.imagePath,
    required this.link,
    required this.instag,
    required this.git


  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CvHomePage(
              firstName: firstName,
              lastName: lastName,
              address: address,
              email: email,
              phoneNumber: phoneNumber,
              imagePath: imagePath,
              aboutMe: aboutMe,
              fonction: fonction,
              link:link,
              instag:instag,
              git: git,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),        leading: Container(
        width: 200, // Définissez la largeur souhaitée de l'avatar
        height: 250, // Définissez la hauteur souhaitée de l'avatar
        alignment: Alignment.center, // Pour centrer le contenu
        child: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
        title: Text(firstName),
        subtitle: Text(lastName),
      ),

    );

  }

}