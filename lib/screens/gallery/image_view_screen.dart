import 'package:flutter/material.dart';

class ImageArguments {
  final String imagePath;
  final bool isAssetImage;

  ImageArguments({required this.imagePath, required this.isAssetImage});
}

class ImageViewScreen extends StatefulWidget {
  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  late PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 0);
  int activePage = 0;

  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://th.bing.com/th/id/OIP.9Qk6_Olx2O7ov3bf3VWp3gHaE7?rs=1&pid=ImgDetMain"
  ];

  String dropdownInitialValue = 'Item One';
  String _selectedOption = 'Option One';
  var items = ['Item One', 'Item Two', 'Item Three'];
  var secondDropdownList = ['Option One', 'Option Two', 'Option Three'];

  List<String> getSecondDropdownValues(String value) {
    switch (value) {
      case 'Item One':
        return ['One.One', 'One.Two', 'One.Three'];
      case 'Item Two':
        return ['Two.One', 'Two.Two', 'Two.Three'];
      case 'Item Three':
        return ['Three.One', 'Three.Two', 'Three.Three'];
      default:
        return ['Option One', 'Option Two', 'Option Three'];
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final ImageArguments args =
        ModalRoute.of(context)!.settings.arguments as ImageArguments;

    AnimatedContainer slider(images, pagePosition, active) {
      double margin = active ? 2 : 6;
      return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: pagePosition == 0
                ? (args.isAssetImage
                    ? AssetImage(args.imagePath) as ImageProvider
                    : NetworkImage(args.imagePath))
                : NetworkImage(images[pagePosition - 1]),
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: PageView.builder(
              itemCount: 4,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (pageNum) {
                setState(() {
                  activePage = pageNum;
                  // print('I am activePage : $activePage');
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length + 1, activePage),
          ),
          SizedBox(height: 50),
          DropdownButton(
            value: dropdownInitialValue,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            items: items.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              },
            ).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownInitialValue = newValue!;
                print('dropdownInitialValue: $dropdownInitialValue');
                secondDropdownList = getSecondDropdownValues(dropdownInitialValue);
                print(secondDropdownList);
              });
            },
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: DropdownButtonFormField<String>(
              value: secondDropdownList[0] ?? _selectedOption,
              items: secondDropdownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.cyan),
                      const SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  // secondDropdownList[0] = value!;
                  _selectedOption = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Select an option',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  // print('Active page - $currentIndex');
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
