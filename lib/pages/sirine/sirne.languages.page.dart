import 'package:flutter/material.dart';

class LanguagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les Langues'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Langues',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: LanguageList(),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _showAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(_showAnimation ? 16.0 : 0), // Animation de padding
          margin: EdgeInsets.symmetric(vertical: _showAnimation ? 8.0 : 0), // Animation de marge
          decoration: BoxDecoration(
            color: _showAnimation ? Colors.white : Colors.transparent, // Animation de couleur de fond
            borderRadius: _showAnimation ? BorderRadius.circular(10.0) : BorderRadius.circular(0), // Animation de bordure
            boxShadow: _showAnimation ? [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))] : [], // Animation d'ombre
          ),
          child: Opacity(
            opacity: _showAnimation ? 1.0 : 0.0, // Animation d'opacité
            child: LanguageTile(language: 'English', level: 'B2', percentage: 80, languageIcon: Icons.language),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(_showAnimation ? 16.0 : 0), // Animation de padding
          margin: EdgeInsets.symmetric(vertical: _showAnimation ? 8.0 : 0), // Animation de marge
          decoration: BoxDecoration(
            color: _showAnimation ? Colors.white : Colors.transparent, // Animation de couleur de fond
            borderRadius: _showAnimation ? BorderRadius.circular(10.0) : BorderRadius.circular(0), // Animation de bordure
            boxShadow: _showAnimation ? [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 5, blurRadius: 7, offset: Offset(0, 3))] : [], // Animation d'ombre
          ),
          child: Opacity(
            opacity: _showAnimation ? 1.0 : 0.0, // Animation d'opacité
            child: LanguageTile(language: 'French', level: 'B2', percentage: 90, languageIcon: Icons.language),
          ),
        ),
        // Ajoutez d'autres langues ici...
      ],
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String language;
  final String level;
  final int percentage; // Nouveau attribut pour le pourcentage
  final IconData languageIcon; // Nouveau attribut pour l'icône de langue

  const LanguageTile({
    required this.language,
    required this.level,
    required this.percentage,
    required this.languageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            languageIcon, // Utilisez la nouvelle icône de langue
            size: 48.0,
            color: Colors.blue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Niveau $level',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: CircularProgressIndicator(
              value: percentage / 100, // Utilisez le pourcentage pour la valeur
              strokeWidth: 10.0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          Text(
            '$percentage%', // Afficher le pourcentage
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
