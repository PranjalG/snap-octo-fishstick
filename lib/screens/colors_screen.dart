import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  static List<MaterialColor> worldColours = [
    Colors.brown,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.teal,
    Colors.grey,
    Colors.deepPurple,
  ];

  var index = Random().nextInt(worldColours.length);
  var previousIndex = 0;

  // final player = AudioPlayer();
  String audioFile = 'song.mp3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Colors World'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: worldColours[index],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [worldColours[previousIndex], Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://www.freepngimg.com/download/coffee/33957-5-coffee-logo-transparent-background.png",
                height: 130,
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                child: Text('Change Color'),
                onPressed: () async {
                  print('Go sounds!');
                  try {
                    // await player.play(AssetSource(audioFile));
                  } catch (e) {
                    print('Error playing audio: $e');
                  }
                  setState(() {
                    previousIndex = index;
                    index = Random().nextInt(7);
                  });
                },
              ),
              SizedBox(height: 20.h),

              // FloatingActionButton(
              //   child: Icon(Icons.cancel_rounded),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
