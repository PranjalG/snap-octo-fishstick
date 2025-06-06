import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String title;
  final String author;
  final String body;

  PostItem(this.title, this.author, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.lightBlue[100], // Light blue background color
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.lightBlue, // Thick border color
          width: 1, // Border thickness
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow color
            spreadRadius: 2, // Spread of the shadow
            blurRadius: 8, // Blur effect
            offset: Offset(0, 4), // Shadow position (horizontal, vertical)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'By - ' + author,
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              (body.length > 200 ? body.substring(0, 200) + '...' : body),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
