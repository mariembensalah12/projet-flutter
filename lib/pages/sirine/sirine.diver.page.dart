import 'package:flutter/material.dart';

class DiverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centres d\'intérêt'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          AnimatedInterestCard(
            title: 'Musique',
            icon: Icons.music_note,
            color: Colors.purple,
            delay: 0,
          ),
          AnimatedInterestCard(
            title: 'Lecture',
            icon: Icons.book,
            color: Colors.indigo,
            delay: 200,
          ),
          AnimatedInterestCard(
            title: 'Voyages',
            icon: Icons.airplanemode_active,
            color: Colors.teal,
            delay: 400,
          ),
          AnimatedInterestCard(
            title: 'Sports',
            icon: Icons.sports_soccer,
            color: Colors.orange,
            delay: 600,
          ),
        ],
      ),
    );
  }
}

class AnimatedInterestCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final int delay;

  const AnimatedInterestCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.delay,
  });

  @override
  _AnimatedInterestCardState createState() => _AnimatedInterestCardState();
}

class _AnimatedInterestCardState extends State<AnimatedInterestCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
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
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: SlideTransition(
            position: _offsetAnimation,
            child: InterestCard(
              title: widget.title,
              icon: widget.icon,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class InterestCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const InterestCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Action lorsque la carte est tapée
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 64.0,
                color: color,
              ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
