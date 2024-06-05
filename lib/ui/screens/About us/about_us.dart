import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Red Crescent',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'The Red Crescent is a humanitarian organization that provides emergency assistance, disaster relief, and education in communities affected by crises. Part of the International Red Cross and Red Crescent Movement, it operates in many countries across the world, primarily in predominantly Muslim regions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our mission is to alleviate human suffering, protect life and health, and uphold human dignity, especially during emergencies and disasters. We strive to ensure that aid reaches the most vulnerable, without discrimination based on nationality, race, religious beliefs, class, or political opinions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Our Services',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Emergency Response: Rapid deployment to natural disasters, conflicts, and health emergencies to provide immediate relief, including medical aid, shelter, food, and clean water.\n\n'
              'Health Services: Provision of healthcare services, including mobile clinics, vaccination campaigns, and health education programs to prevent disease and promote well-being.\n\n'
              'Disaster Preparedness: Training and equipping communities to better prepare for and respond to disasters, reducing their impact and enhancing resilience.\n\n'
              'Humanitarian Aid: Support for refugees and displaced persons, including food distribution, mental health services, and vocational training programs to help rebuild lives.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Our Principles',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We adhere to the fundamental principles of the International Red Cross and Red Crescent Movement:\n\n'
              'Humanity: We promote mutual understanding, friendship, cooperation, and lasting peace among all people.\n\n'
              'Impartiality: We do not discriminate based on nationality, race, religious beliefs, class, or political opinions.\n\n'
              'Neutrality: We do not take sides in hostilities or engage in controversies of a political, racial, religious, or ideological nature.\n\n'
              'Independence: Our organizations must always maintain autonomy, so they may act in accordance with Red Crescent principles.\n\n'
              'Voluntary Service: We are a voluntary relief movement not prompted in any manner by desire for gain.\n\n'
              'Unity: There can be only one Red Crescent Society in any one country, which must be open to all.\n\n'
              'Universality: The Red Crescent Movement is a worldwide institution in which all societies have equal status and share equal responsibilities and duties in helping each other.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Get Involved',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Join us in our mission to bring relief and hope to those in need. Whether through volunteering, donating, or partnering with us, your support can make a significant difference.\n\n'
              'For more information, visit our website or contact your local Red Crescent branch.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
