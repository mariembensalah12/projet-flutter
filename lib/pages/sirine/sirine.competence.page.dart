import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CompetencePage extends StatefulWidget {
  @override
  _CompetencePage1State createState() => _CompetencePage1State();
}

class _CompetencePage1State extends State<CompetencePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compétences'),
        backgroundColor: Colors.indigo, // Couleur de l'app bar
      ),
      body: Container(
        color: Colors.grey[100], // Arrière-plan gris clair
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // Largeur maximale du conteneur
              decoration: BoxDecoration(
                color: Colors.white, // Couleur de fond du conteneur
                borderRadius: BorderRadius.circular(10.0), // Coins arrondis du conteneur
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Compétences',
                      style: TextStyle(
                        fontSize: 28, // Augmenter la taille de la police
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo, // Couleur du titre
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300, // Hauteur du graphique
                      child: AnimatedBarChart(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Définir une palette de couleurs personnalisée compatible avec le thème indigo
    final customPalette = [
      charts.ColorUtil.fromDartColor(Colors.indigo.shade300), // Couleur par défaut
      charts.ColorUtil.fromDartColor(Colors.indigo.shade400), // Couleur plus claire
      charts.ColorUtil.fromDartColor(Colors.indigo.shade500), // Couleur encore plus claire
      charts.ColorUtil.fromDartColor(Colors.indigo.shade600), // Couleur plus sombre
      charts.ColorUtil.fromDartColor(Colors.indigo.shade700), // Couleur secondaire
      charts.ColorUtil.fromDartColor(Colors.indigo.shade800), // Couleur secondaire plus claire
      charts.ColorUtil.fromDartColor(Colors.indigo.shade900), // Couleur secondaire encore plus claire
    ];

    // Données pour le graphique à barres
    var data = [
      new Skill('Java', 60),
      new Skill('Python', 85),
      new Skill('C++', 80),
      new Skill('TypeScript', 75),
      new Skill('Php', 70),
      new Skill('C#', 65),
      new Skill('Sql', 50),
    ];

    var series = [
      new charts.Series(
        id: 'Skills',
        data: data,
        domainFn: (Skill skill, _) => skill.skillName,
        measureFn: (Skill skill, _) => skill.skillLevel,
        colorFn: (_, index) => customPalette[index! % customPalette.length], // Utiliser la palette de couleurs personnalisée
      )
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
      vertical: false, // Histogramme horizontal
      barRendererDecorator: new charts.BarLabelDecorator<String>(), // Décorateur de libellé de barre
      domainAxis: new charts.OrdinalAxisSpec(
        showAxisLine: true, // Afficher la ligne d'axe
        renderSpec: new charts.SmallTickRendererSpec( // Spécification du rendu pour les étiquettes de l'axe des ordonnées
          labelStyle: new charts.TextStyleSpec(
            fontSize: 16, // Augmenter la taille de la police
            color: charts.MaterialPalette.gray.shadeDefault, // Couleur des étiquettes
          ),
          lineStyle: new charts.LineStyleSpec(
            color: charts.MaterialPalette.gray.shadeDefault, // Couleur des lignes de grille
          ),
        ),
      ), // Aucun libellé sur l'axe X
      defaultRenderer: new charts.BarRendererConfig(
        // Styles des barres
        cornerStrategy: const charts.ConstCornerStrategy(30), // Coins arrondis
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 2.0, // Largeur de la bordure des barres
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
      ),
    );

    return chart;
  }
}

class Skill {
  final String skillName;
  final int skillLevel;

  Skill(this.skillName, this.skillLevel);
}
