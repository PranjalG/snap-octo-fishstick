import 'package:flutter/material.dart';
import 'package:layout/services/routes.dart';
import 'package:layout/screens/home_page/button_section_screen.dart';
import 'package:layout/screens/home_page/title_section_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.appTitle});

  final String? appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/lake.jpg',
                fit: BoxFit.fill,
              ),
            ),
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
            ButtonSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                textAlign: TextAlign.justify,
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.moreOptionsScreen);
              },
              child: Text(
                "Go to More Options",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
