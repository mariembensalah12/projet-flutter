import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sirine/sirine.academic.page.dart' as sirineAcademicPage;
import 'mariam/mariam.academic.page.dart' as AlaAcademicPage;
import 'sirine/sirine.professionelle.page.dart' as sirinePro;
import 'mariam/mariam.professionelle.page.dart' as AlaPro;
import 'sirine/sirine.project.page.dart' as SIRINEProject;
import 'sirine/sirine.competence.page.dart' as sirineCompetence;
import 'mariam/mariam.competence.page.dart' as AlaCompetence;
import 'sirine/sirne.languages.page.dart' as sirineLanguage;
import 'mariam/mariam.languages.page.dart' as AlaLanguage;
import 'sirine/sirine.associative.page.dart' as sirineAssociativ;
import 'mariam/mariam.associative.page.dart' as AlaAssociativ;
import 'sirine/sirine.diver.page.dart' as sirineDiver;
import 'mariam/mariam.diver.page.dart' as AlaDiver;
import 'package:flutter_svg/flutter_svg.dart';


class CvHomePage extends StatelessWidget {
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

  CvHomePage({
    required this.firstName,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('$firstName $lastName'),
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        '$imagePath',
                        width: 70,
                        height: 76,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildNavigationIcon(
                  context,
                  Icons.school,
                  'Academic',
                  sirineAcademicPage.AcademicPage(),
                  AlaAcademicPage.AcademicPage(),
                ),
                buildNavigationIcon(
                  context,
                  Icons.work,
                  'Professional',
                  sirinePro.ProfessionnelPage(),
                  AlaPro.ProfessionnelPage(),
                ),
                buildNavigationIcon(
                  context,
                  Icons.star,
                  'Competences',
                  sirineCompetence.CompetencePage(),
                  AlaCompetence.CompetencePage1(),
                ),
                buildNavigationIcon(
                  context,
                  Icons.language,
                  'Languages',
                  sirineLanguage.LanguagesPage(),
                  AlaLanguage.LanguagesPage(),
                ),
                buildNavigationIcon(
                  context,
                  Icons.people,
                  'Associations',
                  sirineAssociativ.AssociativePage(),
                  AlaAssociativ.AssociativePage(),
                ),
                buildNavigationIcon(
                  context,
                  Icons.favorite,
                  'Hobbies',
                  sirineDiver.DiverPage(),
                  AlaDiver.DiverPage(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$fonction',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 40),
                    buildClickableAddress('Address', '$address'),
                    buildInfoRow('Phone Number', '$phoneNumber', Icons.phone),
                    buildInfoRow('Email', '$email', Icons.alternate_email),

                    SizedBox(height: 20),
                    // Espacement entre l'icône et le texte "About Me"
                    Row(
                      children: [
                        buildClickableFacebook('$link'),
                        SizedBox(width: 10), // Espacement de 10 pixels
                        buildClickableInstag('$instag'),
                        SizedBox(width: 10), // Espacement de 10 pixels
                        buildClickableGit('$git'),
                      ],
                    ),


                    SizedBox(height: 20),

                    Text(
                      'About Me',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$aboutMe',
                      style: TextStyle(fontSize: 18),

                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildNavigationIcon(BuildContext context, IconData icon, String label,
      Widget sirinePage, Widget alaPage) {
    return Column(
      children: [
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            if (firstName == "Sirine") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        // Durée de l'animation
                        child: sirinePage,
                        // Page à afficher avec animation
                        transitionBuilder: (Widget child,
                            Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1.0, 0.0),
                              // Animation commence de la droite
                              end: Offset
                                  .zero, // Animation finit à sa position d'origine
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: alaPage,
                        transitionBuilder: (Widget child,
                            Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                ),
              );
            }
          },
          child: Icon(icon, size: 36,
              color:Colors.brown[300]), // Changement de la taille et de la couleur de l'icône
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildInfoRow(String label, String value, [IconData? icon]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon), // Ajout de l'icône avant le texte de l'adresse
            SizedBox(width: 5), // Espacement entre l'icône et le texte
            Text(
              '$label:',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildClickableAddress(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, size: 30, color: Colors.brown),
            // Icône de localisation avec une taille et une couleur modifiées
            SizedBox(width: 5),
            Text(
              '$label:',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            launchMap(value); // Lancer Google Maps avec l'adresse
          },
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.brown[900],
              // Changez la couleur pour indiquer que c'est cliquable
              decoration: TextDecoration
                  .underline, // Soulignez le texte pour indiquer qu'il est cliquable
            ),
          ),
        ),
      ],
    );
  }

  Widget buildClickableFacebook(String link) {
    return GestureDetector(
      onTap: () {
        launch(link);
      },
      child: Row(
        children: [
          Icon(Icons.facebook, size: 30, color: Colors.blue),

        ],
      ),
    );
  }
  Widget buildClickableInstag(String link) {
    return GestureDetector(
      onTap: () {
        launch(link);
      },
      child: Row(
        children: [
          Image.asset(
            'lib/images/OIP.jpg',
            width: 24,
            height: 24,
          ),

        ],
      ),
    );
  }
  Widget buildClickableGit(String link) {
    return GestureDetector(
      onTap: () {
        launch(link);
      },
      child: Row(
        children: [
          Image.asset(
            'lib/images/25231 (1).png',
            width: 24,
            height: 24,
          ),

        ],
      ),
    );
  }

  Future<void> launchMap(String address) async {
    // Utiliser url_launcher pour ouvrir l'adresse dans Google Maps
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$address';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
