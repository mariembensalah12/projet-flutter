import 'package:flutter/material.dart';
import 'package:animations/animations.dart'; // Import des animations
import '../../widget/custom_card.dart'; // Assurez-vous d'importer correctement votre carte personnalisée

class ProfessionnelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expérience Professionnelle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCustomCard(
              title: 'Stage ouvrier',
              subTitle: 'Platana',
              duration: '1 mois',
              description: 'Développement d\'une plateforme web sportive et sociale.',
              icon: Icons.construction,
              iconColor: Colors.orange,
              image: 'lib/images/travel-time.jpg',
            ),
            SizedBox(height: 16.0),
            _buildCustomCard(
              title: 'Projet CartShop',
              subTitle: '',
              duration: '',
              description: 'Développement d\'une application de gestion des stocks en .NET.',
              icon: Icons.shopping_cart,
              iconColor: Colors.green,
              image: 'lib/images/cartshop.jpg', // Spécifiez le chemin de l'image
            ),

            SizedBox(height: 16.0),
            _buildCustomCard(
              title: 'Gestion de stock',
              subTitle: '',
              duration: '',
              description: 'Développement d\'une application de gestion des stocks en .NET.',
              icon: Icons.shopping_cart,
              iconColor: Colors.green,
              image: 'lib/images/gestion.jpg', // Spécifiez le chemin de l'image
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCard({
    required String title,
    required String subTitle,
    required String duration,
    required String description,
    required IconData icon,
    required Color iconColor,
    String? image,
  }) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        // Afficher la carte d'image lorsque la carte est ouverte
        return ImageCard(image: image, description: description);
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        // Afficher la carte fermée
        return GestureDetector(
          onTap: openContainer,
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: 40,
                        color: iconColor,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ImageCard extends StatefulWidget {
  final String? image;
  final String? description;

  const ImageCard({Key? key, this.image, this.description}) : super(key: key);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 0.5), end: Offset.zero).animate(
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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                height: 300, // Height of the image container
                child: Image.asset(
                  widget.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.description ?? '',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}