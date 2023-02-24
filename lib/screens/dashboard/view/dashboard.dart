import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/animation/transition.dart';
import 'package:ten_twenty_asssignment/screens/dashboard/upcoming_provider/upcoming_provider.dart';
import 'package:ten_twenty_asssignment/screens/watch/components/movie_details.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("Watch",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.search_sharp),)
                  ],
                ),
              ),
            ),
            _upcomingProvider.isDataFetched ? Expanded(
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemCount: _upcomingProvider.categoryList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
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
                            height: 180,
                            decoration:  BoxDecoration(
                              color: Colors.deepOrange,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://image.tmdb.org/t/p/w780/${_upcomingProvider.categoryList[index]['poster_path']}"
                                  ),
                                  fit: BoxFit.cover
                              ),
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
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              _upcomingProvider.categoryList[index]['original_title'],
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) :  Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
