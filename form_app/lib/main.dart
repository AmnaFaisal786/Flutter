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
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
         length: 2,
         child: Scaffold(
          appBar: AppBar(
            title:Text(' Sign In & Sign Up Forms'),
            bottom: TabBar (
              tabs: [
                Tab(text: 'login'),
                Tab(text: 'Sign In',)
              ],
            ),
          ),
          body: TabBarView(children: [
             LoginCard(),
            SignUpCard(),
          ]),
          
         ),
      ),
    );
   }
}
 class MyWidget extends StatelessWidget { 
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Your password'),
            ),
            SizedBox(height: 10),
            

          ],
        ),
        ),
      ),
    );
  }
}
