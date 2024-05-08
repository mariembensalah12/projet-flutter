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
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.transparent, // Assurez-vous que l'arrière-plan est transparent
          child: ClipOval( // Utilisez ClipOval pour que l'image soit correctement centrée
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Assurez-vous que l'image remplit le cercle
            ),
          ),
        ),

        title: Text(firstName),
        subtitle: Text(lastName),
        trailing: Icon(Icons.arrow_forward),
        onTap: (){
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
                link: link,
                instag: instag,
                git: git,
              ),
            ),
          );



        },
      ),
    );
  }
}