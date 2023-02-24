import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/animation/transition.dart';
import 'package:ten_twenty_asssignment/screens/dashboard/upcoming_provider/upcoming_provider.dart';
import 'package:ten_twenty_asssignment/screens/watch/genre_provider/genre_provider.dart';

import 'movie_details.dart';

class MoviesCategories extends StatefulWidget {
  const MoviesCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<MoviesCategories> createState() => _MoviesCategoriesState();
}

class _MoviesCategoriesState extends State<MoviesCategories> {

  UpcomingProvider _upcomingProvider = UpcomingProvider();

  @override
  void initState() {

    _upcomingProvider = Provider.of<UpcomingProvider>(context , listen: false);
    _upcomingProvider.fetchUpcomingMovies();


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UpcomingProvider>(context , listen: true);
    return Expanded(
      child: Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 200 / 125,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext ctx, index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              Transitions(
                                  page:  MovieDetails(
                                    fetchedDetailId: _upcomingProvider.categoryList[index]['id'],
                                  )));
                        },
                        child: Container(
                          decoration:  BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://image.tmdb.org/t/p/w780/${_upcomingProvider.categoryList[index]['poster_path']}"),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                          ),
                        ),

                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            _upcomingProvider.categoryList[index]['title'],
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  );
                },itemCount: _upcomingProvider.categoryList.length,),
          )),
    );
  }
}
