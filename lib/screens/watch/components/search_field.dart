import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/screens/watch/components/movie_details.dart';
import 'package:ten_twenty_asssignment/screens/watch/genre_provider/genre_provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController search = TextEditingController();
  String movieName = '';
  GenreProvider _genreProvider = GenreProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _genreProvider = Provider.of<GenreProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GenreProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]),
            child: TextFormField(
              onSaved: (customCake) {
                // Email
              },
              controller: search,
              textInputAction: TextInputAction.go,
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "TV shows, movies and more",
                hintStyle: Theme.of(context).textTheme.headline3,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: Theme.of(context).primaryColorLight,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (search.text != '') {
                      _genreProvider.searchMovies(search.text);

                      setState(() {
                        movieName = search.text;
                      });
                    } else {
                      setState(() {
                        movieName = '';
                      });
                    }
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          movieName == ''
              ? const Center(
            child: Text("No Result Found"),
          )
              : Expanded(
            child: FutureBuilder(
              future: _genreProvider.searchMovies(search.text),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  final List movieData = snapshot.data.movies;
                  movieData
                      .removeWhere((item) => item['poster_path'] == null);
                  if (movieData == []) {
                    return Container();
                  } else {
                    return Container(
                      color: Colors.red,
                      height: 500,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final String posterPath =
                            movieData[index]['poster_path'];

                            return Container(
                              child: Card(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return MovieDetails(
                                            fetchedDetailId:
                                            movieData[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: FadeInImage.assetNetwork(
                                      placeholder:
                                      'assets/images/loading.gif',
                                      image:
                                      'http://image.tmdb.org/t/p/w780/$posterPath'),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
