import 'package:flutter/material.dart';

class AssociativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vie Associative'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildAssociativeCard(
            title: 'Membre',
            institution: 'IIT Python Tunisia Club',
            dates: 'Décembre 2021',
            icon: Icons.group,
            delay: 0,
          ),
          _buildAssociativeCard(
            title: 'Vice Président Finance & Légalité',
            institution: 'AIESEC Sfax',
            dates: 'De janvier 2018 à octobre 2018',
            icon: Icons.business_center,
            delay: 200,
          ),
          _buildAssociativeCard(
            title: 'Organisateur',
            institution: 'Journée Porte Ouverte Faculté des Sciences Sfax',
            dates: 'Avril 2017',
            icon: Icons.event,
            delay: 400,
          ),
        ],
      ),
    );
  }

  Widget _buildAssociativeCard({
    required String title,
    required String institution,
    required String dates,
    required IconData icon,
    required int delay,
  }) {
    return AnimatedAssociativeCard(
      title: title,
      institution: institution,
      dates: dates,
      icon: icon,
      delay: delay,
    );
  }
}

class AnimatedAssociativeCard extends StatefulWidget {
  final String title;
  final String institution;
  final String dates;
  final IconData icon;
  final int delay;

  const AnimatedAssociativeCard({
    required this.title,
    required this.institution,
    required this.dates,
    required this.icon,
    required this.delay,
  });

  @override
  _AnimatedAssociativeCardState createState() => _AnimatedAssociativeCardState();
}

class _AnimatedAssociativeCardState extends State<AnimatedAssociativeCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 300),
      value: 0,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100 * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: _buildAssociativeCard(),
          ),
        );
      },
    );
  }

  Widget _buildAssociativeCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          // Action lorsque la carte est tapée
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 64.0,
                  color: Colors.blue,
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.institution,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.dates,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
