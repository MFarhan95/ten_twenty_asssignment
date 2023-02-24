import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GenreProvider extends ChangeNotifier{
  late BuildContext context;
  late bool isDataFetched = false;
  dynamic movieData;


  Future fetchMovieDetails(int id) async {
    final response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/movie/$id?api_key=9874c8416432f9f9058e0b639bc40724&language=en-US"));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      movieData = map;
      isDataFetched = true;
      return movieData;
    } else {
      throw Exception('not able to Fetch any details');
    }
  }


  Future searchMovies(String keyWord) async {
    final response = await http
        .get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=9874c8416432f9f9058e0b639bc40724&language=en-US&query=$keyWord&page=1&include_adult=false"));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      movieData = map;
      isDataFetched = true;
      print("object");

      return movieData;
    } else {
      throw Exception('not able to Fetch any details');
    }
  }






}