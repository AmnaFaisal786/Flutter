import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late List<dynamic> movieList;
  late List<dynamic> filteredMovieList;

  @override
  void initState() {
    super.initState();
    movieList = [];
    filteredMovieList = [];
    readJsonData();
  }

  void readJsonData() async {
    var dio = Dio();
    var response =
        await dio.get("https://www.omdbapi.com/?s=games&apikey=6ff571af");
    setState(() {
      movieList = response.data["Search"] as List<dynamic>;
      filteredMovieList = List.from(movieList);
    });
  }

  void searchMovies(String query) async {
    var dio = Dio();
    var response = await dio.get("https://www.omdbapi.com/?s=$query&apikey=6ff571af");

    setState(() {
      if (response.data != null && response.data["Search"] != null) {
        movieList = response.data["Search"] as List<dynamic>;
      } else {
        // Handle the case when the response is null or does not contain "Search" key
        // print("Error: Invalid response from the API");
        // You might want to show an error message to the user or take appropriate action.
      }

      filteredMovieList = List.from(movieList);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: searchMovies,
            decoration: const InputDecoration(
              
              hintText: 'Search movies...',
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: filteredMovieList.length,
          itemBuilder: (context, index) {
            return MovieCard(
              title: filteredMovieList[index]["Title"],
              year: filteredMovieList[index]["Year"],
              posterUrl: filteredMovieList[index]["Poster"],
              onTap: () {
                // Handle movie tap
                // Navigate to the MovieDetails widget with the selected movie data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(
                      title: filteredMovieList[index]["Title"],
                      year: filteredMovieList[index]["Year"],
                      posterUrl: filteredMovieList[index]["Poster"],
                      // Add other relevant details 
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final String title;
  final String year;
  final String posterUrl;

  const MovieDetails({
    required this.title,
    required this.year,
    required this.posterUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45),
        child: Center(
          child: Container(
            height: 350,
            child: Card(
              color: Colors.amber[500],
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Image.network(
                      posterUrl,
                      height: 150,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      year,
                      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),    
                  ),
                  ElevatedButton(onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const MyWidget())) ;
                  }, style: ElevatedButton.styleFrom(
              minimumSize:
                  const Size(double.infinity, 50), 
              padding: const EdgeInsets.all(20),
            ),
                   child: const Text("Go Back"))
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String year;
  final String posterUrl;
  final VoidCallback onTap;

  const MovieCard({
    required this.title,
    required this.year,
    required this.posterUrl,
     required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber[500],
      
      elevation: 5,
      child: Column(
        
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(55.0),
                  child: Image.network(
                    posterUrl,
                    height: 90,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        year,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 10),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              minimumSize:
                  const Size(double.infinity, 50), 
              padding: const EdgeInsets.symmetric(
                  horizontal: 16),
            ),
            child: const Text('More Details'),
          ),
        ],
      ),
    );
  }
}
