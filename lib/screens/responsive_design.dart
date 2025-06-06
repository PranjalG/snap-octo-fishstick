import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Responsive Design Screen'),
        ),
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
      ),
      body:
      LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNarrowContainers();
          }
        },
      ),

      // Center(
      //   child: Text(
      //     'Screen width: ${screenSize.width}, height: ${screenSize.height}',
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
    );
  }

  Widget _buildWideContainers() {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.red, height: 200)),
        Expanded(child: Container(color: Colors.blue, height: 200)),
      ],
    );
  }

  Widget _buildNarrowContainers() {
    return Column(
      children: [
        Container(color: Colors.red, height: 200),
        Container(color: Colors.blue, height: 200),
      ],
    );
  }
}
