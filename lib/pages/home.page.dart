import 'package:flutter/material.dart';
import '../widget/widget.card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkMode = false;

  ThemeData _lightTheme = ThemeData(
    primaryColor: Colors.brown[300],
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.brown[300],
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
  );
  ThemeData _darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon curriculum vitae',
      theme: _isDarkMode ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mon curriculum vitae'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isDarkMode = !_isDarkMode;
                });
              },
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _isDarkMode ? Colors.grey[900]! : Colors.brown[200]!,
                _isDarkMode ? Colors.grey[800]! : Colors.brown[100]!,
                _isDarkMode ? Colors.grey[700]! : Colors.brown[50]!,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: 2, // Nombre d'éléments dans votre liste
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.0, // Ajoutez un espacement entre les cartes
                    ),
                    SizedBox(
                      height: 100, // Augmentez la hauteur pour agrandir l'image
                      child: GestureDetector(
                        onTap: () {
                          print('Allez voir le CV de ${index == 0 ? 'Sirine' : 'Mariam'}');
                        },
                        child: MyCardWidget(
                          firstName: index == 0 ? 'Sirine' : 'Mariam',
                          lastName: index == 0 ? 'Ben Daii' : 'Ben Salah',
                          address: index == 0 ? 'Route Tanyour km8 ' : 'Route Tunis km9,sfax',
                          email: index == 0 ? 'sirinebendai@gmail.com' : 'mariambensalh@gmail.com',
                          phoneNumber: index ==0 ?'44 185 562':'28736937',
                          imagePath: index == 0 ? 'lib/images/sirine.jpg' : 'lib/images/mariam.jpg',
                          fonction: index == 0 ? 'Étudiant génie logiciel & informatique décisionnelle' : 'Ingénieur logiciel',
                          aboutMe: index == 0 ? 'Étudiant en par la technologie, innovation et la résolution de problèmes. Je suis à la recherche d\'un stage d\'été pour acquérir une expérience pratique et mettre en pratique mes compétences. Doté d\'une forte capacité d\'analyse et d\'un esprit créatif, je suis prêt à apporter une contribution positive et à apprendre de nouvelles compétences au sein de votre entreprise.' : 'Je suis étudiant en génie logiciel senior, je suis une personne sociable, énergique et ponctuelle avec la volonté et la dédication nécessaires pour apprendre et maîtriser de nouvelles technologies. Mon objectif est de prouver et d\'améliorer ma présence dans la vie professionnelle ainsi que dans la vie associative. J\'aimerais mettre mes compétences à votre disposition.',
                          link: index==0 ? 'https://www.facebook.com/sirine.bendai.7':'https://www.facebook.com/mariem.bensalah.520',
                          instag: index==0 ? 'https://www.instagram.com/sirine_ben_dai/':'https://www.instagram.com/mariem.bensalah.520',
                          git: index==0 ? '':'https://github.com/mariembensalah12',
                        ),
                      ),
                    ),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
