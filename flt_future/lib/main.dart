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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Future Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            print('Start of the button press');

            // Simulating a delayed operation
            String result = await fetchData();
            print(result);

            print('End of the button press');
          },
          child: Text('Press me'),
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    // Simulating a delayed operation
    await Future.delayed(Duration(seconds: 2));
    return 'Data fetched successfully!';
  }
}
