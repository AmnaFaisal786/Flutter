import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Assignment : displaying Image ListView with Icons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: MyImageList(),
      ),
    );
  }
}

class MyImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text("Heelo");
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          return ImageListItem(
              imageUrl: 'images/${index + 1}.jpg', index: index);
        } else {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Icon(Icons.favorite),
                // Icon(Icons.save),
                // Icon(Icons.copy),
                // Icon(Icons.share),
              ],
            ),
          );
        }
      },
    );
  }
}

class ImageListItem extends StatelessWidget {
  final String imageUrl;
  final int index;

  const ImageListItem({required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 400.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite),
                Icon(Icons.save),
                Icon(Icons.copy),
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
