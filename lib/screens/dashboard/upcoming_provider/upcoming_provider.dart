import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class UpcomingProvider extends ChangeNotifier{

  late BuildContext context;
  late bool isDataFetched = false;
  var categoryList = [];
  dynamic movieData;

  Future fetchUpcomingMovies() async {
    final response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=9874c8416432f9f9058e0b639bc40724"));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> categoryFetched = map["results"];
      categoryList = categoryFetched;
      isDataFetched = true;
      movieData = map;
      notifyListeners();
      print('movies fetched');
      print('movies fetched ${map['results']}');
    //  print('movies fetched $movieData');
    } else {
      throw Exception('not able to Fetch the Upcoming Movies');
    }
  }


}