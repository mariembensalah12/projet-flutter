import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; // Import des animations
import '../../widget/academic.card.dart';

class AcademicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expérience Académique'),
      ),
      body: AnimationLimiter(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 600), // Augmentation de la durée totale
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              _buildTimelineTile(
                date: '09/2022 --> présent',
                institution: 'IIT',
                description: 'Génie Logiciel et Informatique décisionnelle',
                degree: 'Ingénieur',
                fieldOfStudy: 'Informatique',
              ),
              SizedBox(height: 20.0),
              _buildTimelineTile(
                date: '09/2019 ---> 09/2021',
                institution: 'Faculté de science',
                degree: 'Cycle préparatoire',
                fieldOfStudy: 'Physique Chimie',
                description: '',
              ),
              SizedBox(height: 20.0),
              _buildTimelineTile(
                date: '09/2015 ---> 06/2019',
                institution: 'Lycée Sadek feki',
                degree: 'BAC',
                fieldOfStudy: 'Science',
                description: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineTile({
    required String date,
    required String institution,
    required String description,
    required String degree,
    required String fieldOfStudy,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.05,
      isFirst: true,
      indicatorStyle: IndicatorStyle(
        width: 40,
        color: Colors.blue,
        padding: EdgeInsets.all(8),
        indicatorXY: 0.1,
      ),
      beforeLineStyle: const LineStyle(
        color: Colors.blue,
        thickness: 2,
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: AcademicCard(
          institution: institution,
          description: description,
          degree: degree,
          fieldOfStudy: fieldOfStudy,
          dates: date,
        ),
      ),
    );
  }
}
