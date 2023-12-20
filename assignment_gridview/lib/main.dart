import 'dart:math';

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
          title: Text('Grid View Example'),
        ),
        endDrawer: MyDrawer(),
        body: MyGridView(),
        // body: Column(
        //   children: [
        //     MySearchBar(),
        //     Expanded(
        //       child: MyGridView(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Here ...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(14)),
            child: Text(
              'Grid View Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Grid View Assognment'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyGridView()));
            },
          ),
          ListTile(
            title: Text('List View Assignment'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyImageList()));
            },
          ),
        ],
      ),
    );
  }
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}

class MyItem {
  final IconData icon;
  final String title;
  final String emoji;

  MyItem({required this.icon, required this.title, required this.emoji});
}

class MyGridView extends StatelessWidget {
  // Placeholder list of items
  final List<MyItem> items = [
    MyItem(
      icon: Icons.home,
      title: 'Good',
      emoji: '😊',
    ),
    MyItem(
      icon: Icons.wallet,
      title: 'Cheerful',
      emoji: '😎',
    ),
    MyItem(
      icon: Icons.umbrella,
      title: 'Generous',
      emoji: '😃',
    ),
    MyItem(
      icon: Icons.tungsten,
      title: 'Calm',
      emoji: '😊',
    ),
    MyItem(
      icon: Icons.work,
      title: 'Gorgeous',
      emoji: '🥰',
    ),
    MyItem(
      icon: Icons.school,
      title: 'Careful',
      emoji: '😀',
    ),
    MyItem(
      icon: Icons.home,
      title: 'Calm',
      emoji: '😄',
    ),
    MyItem(
      icon: Icons.light,
      title: 'Ambitious',
      emoji: '😍',
    ),
    MyItem(
      icon: Icons.business,
      title: 'Friendly',
      emoji: '😊',
    ),
    MyItem(
      icon: Icons.rocket,
      title: 'Nice',
      emoji: '😎',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: (2 / 1),
      ),
      itemBuilder: (
        context,
        index,
      ) {
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(RouteName.GridViewCustom);
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              color: RandomColorModel().getColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(items[index].icon),
                  Text(
                    '${items[index].title} ${items[index].emoji}',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // Update the number of images
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
