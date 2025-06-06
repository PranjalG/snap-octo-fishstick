import 'package:flutter/material.dart';
import 'package:layout/services/routes.dart';

class MoreOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('More Options'),
        ),
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.colorsScreen);
              },
              child: Text(
                "Colours World >>",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'Books Trivia >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.postsOverviewScreen);
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.galleryScreen);
              },
              child: Text(
                "Go to Gallery >>",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'Go to Settings >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.settingsScreen);
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.toDoListScreen);
              },
              child: Text(
                "To Do List >> ",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.installationScreen);
              },
              child: Text(
                "Installation Screens >> ",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'Pagination screen >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.paginationScreen);
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: const Text(
                'Responsive Design >>',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteId.responsiveDesignScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

// void _navigateToNextScreen(BuildContext context) {
//   Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
// }
}
