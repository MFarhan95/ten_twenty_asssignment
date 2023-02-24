import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/screens/watch/genre_provider/genre_provider.dart';

import 'coponents.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.fetchedDetailId}) : super(key: key);
  final int fetchedDetailId;


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  GenreProvider _genreProvider = GenreProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("this is fetched Id ${widget.fetchedDetailId}");
    _genreProvider = Provider.of<GenreProvider>(context , listen: false);
    _genreProvider.fetchMovieDetails(widget.fetchedDetailId);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GenreProvider>(context , listen: true);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MovieAppBar(
        text: 'Watch',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height:350,
            decoration:  BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://image.tmdb.org/t/p/w780/${_genreProvider.movieData['poster_path']}"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Align(
                  alignment : Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Get Tickets',
                          style:
                              TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.w600
                              ),
                        )),
                  ),
                ),
                Align(
                  alignment : Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child:          OutlinedButton(onPressed: () {}, child: const Text('Watch Trailer',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),))
                      ,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Genres",
              style: Theme.of(context).textTheme.headline4?.copyWith(color: Theme.of(context).bottomAppBarColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Not working from server side. Attached ScreenShot for Confirmation",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "OverView",
              style: Theme.of(context).textTheme.headline4?.copyWith(color: Theme.of(context).bottomAppBarColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              _genreProvider.movieData['overview'],
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 12,
                color: Color.fromRGBO(143, 143, 143, 1)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
