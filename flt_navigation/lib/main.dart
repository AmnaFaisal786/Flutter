import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.pink, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Text('Header')),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Product'),
              leading: Icon(Icons.production_quantity_limits),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Product(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.feedback),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Feedback(title: "Home")));
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About(title: "Home")));
              },
            ),
          ],
        ),
      ),

      body: CardList(),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CardData {
  final String title;
  final String subtitle;
  final String imagePath;

  CardData(
      {required this.title, required this.subtitle, required this.imagePath});
}

class CardList extends StatelessWidget {
  final List<CardData> cardList = [
    CardData(
      title: 'Card 1',
      subtitle: 'Subtitle 1',
      imagePath: 'images/image1.jpg',
    ),
    CardData(
      title: 'Card 2',
      subtitle: 'Subtitle 2',
      imagePath: 'images/image1.jpg',
    ),
    CardData(
      title: 'Card 3',
      subtitle: 'Subtitle 3',
      imagePath: 'images/image1.jpg',
    ),
    CardData(
      title: 'Card 4',
      subtitle: 'Subtitle 4',
      imagePath: 'images/image1.jpg',
    ),
    CardData(
      title: 'Card 5',
      subtitle: 'Subtitle 5',
      imagePath: 'images/image1.jpg',
    ),
    CardData(
      title: 'Card 6',
      subtitle: 'Subtitle 6',
      imagePath: 'images/image1.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            // title: const Text('Card Example'),
            ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Set the number of cards in a row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: cardList.length,
          itemBuilder: (context, index) {
            return buildCard(cardList[index]);
          },
        ),
      ),
    );
  }

  Widget buildCard(CardData cardData) {
    return Card(
      elevation: 8,
      shadowColor: Colors.green,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Apply rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  15), // Apply rounded corners to the container
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Apply rounded corners to the image
              child: Image.asset(
                cardData.imagePath,
                width: 380,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cardData.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            cardData.subtitle,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

// class CardList extends StatelessWidget {
//   const CardList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(

//       padding: EdgeInsets.all(20.0),
//       children: [
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),

//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//         buildCard('Card 1', 'Description for Card 1', Icons.star,
//             'assets/image1.jpg'),
//       ],
//     );
//   }
// }

// Widget buildCard(
//     String title, String Description, IconData icon, String imagePath) {
//   return Card(
//     elevation: 5.0,
//     child: Column(
//       children: [
//         ListTile(
//           title: Text(
//             title,
//             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(Description),
//           leading: Icon(
//             icon,
//             color: Colors.blue,
//           ),
//         ),
//         ButtonBar(
//           children: [
//             ElevatedButton(onPressed: () {}, child: Text('Button 1')),
//             ElevatedButton(onPressed: () {}, child: Text('Button 2')),
//           ],
//         )
//       ],
//     ),
//   );
// }

class Product extends StatelessWidget {
  const Product({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Text('Header')),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Product'),
              leading: Icon(Icons.production_quantity_limits),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Product(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.feedback),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Feedback(title: "Home")));
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Product(title: "Home")));
              },
            ),
          ],
        ),
      ),
      body: ProdList(),
    );
  }
}

class ProdData {
  final String title;
  final String subtitle;
  final String imagePath;

  ProdData(
      {required this.title, required this.subtitle, required this.imagePath});
}

class ProdList extends StatelessWidget {
  final List<ProdData> prodList = [
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
    ProdData(
      title: 'Home',
      subtitle:
          'Flutter is an open source framework by Google for building beautiful',
      imagePath: 'images/image1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            // title: Text('Card Example'),
            ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Set the number of cards in a row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: prodList.length,
          itemBuilder: (context, index) {
            return buildCard(prodList[index]);
          },
        ),
      ),
    );
  }

  Widget buildCard(ProdData prodData) {
    return Card(
      elevation: 8,
      shadowColor: Colors.green,
      margin: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Apply rounded corners
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  15), // Apply rounded corners to the container
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Apply rounded corners to the image
              child: Image.asset(
                prodData.imagePath,
                width: 380,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            prodData.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            prodData.subtitle,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle the first button tap
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the second button tap
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Feedback extends StatelessWidget {
  const Feedback({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          // key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  // controller: username,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "Username",
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  // controller: username,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    icon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  // controller: username,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    labelText: "Phone Number",
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  // controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    icon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 50,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () => {
                    // if (_formKey.currentState?.validate() ?? false) {
                    //   print("Username: ${username.text}, Password: ${password.text}")
                    // }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.pink, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink),
                child: Text('Header')),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Product'),
              leading: Icon(Icons.production_quantity_limits),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Product(title: "Home")));
              },
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.feedback),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Feedback(title: "Home")));
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About(title: "Home")));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class About extends StatefulWidget {
  final String title;

  const About({Key? key, required this.title}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: Text('Header'),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "Home"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Product'),
              leading: Icon(Icons.production_quantity_limits),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Product(title: "Product"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Feedback'),
              leading: Icon(Icons.feedback),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Feedback(title: "Feedback"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(title: "About"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/image1.jpg', // Replace with the actual path to your image
              width: 350,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'About Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
