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
          AssociativeTile(
            title: 'IIT Python Tunisia Club',
            subtitle: 'Membre',
            date: '2021',
            icon: Icons.group,
          ),
          AssociativeTile(
            title: 'Winner of Pydays 2.0 data science competition',
            subtitle: 'Gagnant',
            date: '2022',
            icon: Icons.emoji_events,
          ),
          // Ajoutez d'autres tuiles associatives ici...
        ],
      ),
    );
  }
}

class AssociativeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final IconData icon;

  const AssociativeTile({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48.0,
                color: Colors.blue,
              ),
              SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.0),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.0),
              Text(
                'Date: $date',
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
    );
  }
}
