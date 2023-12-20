import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image List View'),
      ),
      body: ImageListView(),
    );
  }
}

class ImageListView extends StatelessWidget {
  final List<String> imagePaths = [
    'images/image0.jpg',
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
  ];

  final List<String> imageTitles = [
    'Title 0',
    'Title 1',
    'Title 2',
    'Title 3',
    'Title 4',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(imageTitles[index]),
            leading: Image.asset(
              imagePaths[index],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              // Handle tap on the item
            },
          ),
        );
      },
    );
  }
}
