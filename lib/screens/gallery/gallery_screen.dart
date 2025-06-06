import 'package:flutter/material.dart';
import 'package:layout/services/routes.dart';
import 'package:layout/screens/gallery/image_view_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Screen'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 14,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            final isEven = index.isEven;
            final imagePath = isEven
                ? 'assets/images/lake.jpg'
                : 'https://www.shutterstock.com/image-photo/pink-sky-could-on-morning-260nw-1199155426.jpg';
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteId.imageViewScreen,
                  arguments: ImageArguments(
                    imagePath: imagePath,
                    isAssetImage: isEven,
                  ),
                );
              },
              child: Image(
                image: isEven
                    ? AssetImage(imagePath) as ImageProvider
                    : NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
